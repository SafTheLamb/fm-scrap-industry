local ftech = require("__fdsl__.lib.technology")

local global_byproduct_scale = settings.startup["scrap-industry-byproduct-scale"].value
local global_failrate_scale = settings.startup["scrap-industry-failrate-scale"].value
local global_failrate_min = settings.startup["scrap-industry-failrate-min"].value

local function get_ingredient_scrap(ingredient, out)
  if ingredient.type == "item" then
    local item_metadata = ScrapIndustry.items[ingredient.name]
    if item_metadata and not out.recipe_results[item_metadata.scrap] then
      if item_metadata.scale then
        local amount = item_metadata.scale * (ingredient.amount or ((ingredient.amount_min + ingredient.amount_max)/2))
        amount = global_byproduct_scale * amount
        amount = math.floor(100 * amount + 0.5) / 100
        if type(item_metadata.scrap) == "string" then
          out.byproducts[item_metadata.scrap] = (out.byproducts[item_metadata.scrap] or 0) + amount
          out.total_scrap = out.total_scrap + amount
        else
          for _,scrap_name in pairs(item_metadata.scrap) do
            out.byproducts[scrap_name] = (out.byproducts[scrap_name] or 0) + amount
            out.total_scrap = out.total_scrap + amount
          end
        end
      end
      if item_metadata.failrate then
        out.success_penalty = (out.success_penalty or 0) + item_metadata.failrate
      end
    end
  end
end

local function can_modify_recipe(recipe)
  if not recipe.results or #recipe.results == 0 then
    return false
  end

  local recipe_metadata = ScrapIndustry.recipes[recipe.name]
  if recipe_metadata then
    -- ignore=false forces a recipe to be modified, even if the category is ignored
    if type(recipe_metadata.ignore) == "boolean" then
      return not recipe_metadata.ignore
    end

    if recipe_metadata.self_scrap then
      return true
    end
  end

  if recipe.category then
    local category_metadata = ScrapIndustry.categories[recipe.category]
    if category_metadata and category_metadata.ignore then
      return false
    end
  end
  
  for _,result in pairs(recipe.results) do
    local product_metadata = ScrapIndustry.products[result.name]
    if product_metadata and product_metadata.ignore then
      return false
    end
    if result.type == "item" then
      return true
    end
  end
  return false
end

-- if a recipe has an ingredient whose recipe was modified to have a % failrate, it can't be considered as an intermediate for the hand-crafting queue
-- to resolve this, we create hidden duplicates for these recipes
local handcraft_recipes = {}
local handcraft_categories = {}
local handcraft_recipe_map = {}
if settings.startup["scrap-industry-handcraft"].value then
  for _,category in pairs(data.raw.character.character.crafting_categories) do
    handcraft_categories[category] = true
  end
end

local function should_duplicate_for_hand_crafting(recipe, recipe_metadata, out)
  if not settings.startup["scrap-industry-handcraft"].value then
    return false
  end
  if recipe.allow_as_intermediate == false then
    return false
  end
  if recipe_metadata and type(recipe_metadata.force_handcraft) == "boolean" then
    return recipe_metadata.force_handcraft
  end
  if out.success_penalty == 0 then
    return false
  end
  local category = recipe.category or "crafting"
  return handcraft_categories[category] == true
end

-- copied from recycling.lua
local function get_prototype(base_type, name)
  for type_name in pairs(defines.prototypes[base_type]) do
    local prototypes = data.raw[type_name]
    if prototypes and prototypes[name] then
      return prototypes[name]
    end
  end
end

local function get_item_localised_name(name)
  local item = get_prototype("item", name)
  if not item then return end
  if item.localised_name then
    return item.localised_name
  end
  local prototype
  local type_name = "item"
  if item.place_result then
    prototype = get_prototype("entity", item.place_result)
    type_name = "entity"
  elseif item.place_as_equipment_result then
    prototype = get_prototype("equipment", item.place_as_equipment_result)
    type_name = "equipment"
  elseif item.place_as_tile then
    -- Tiles with variations don't have a localised name
    local tile_prototype = data.raw.tile[item.place_as_tile.result]
    if tile_prototype and tile_prototype.localised_name then
      prototype = tile_prototype
      type_name = "tile"
    end
  end
  return prototype and prototype.localised_name or {type_name.."-name."..name}
end

local function duplicate_for_hand_crafting(recipe)
  local duplicate_recipe = util.table.deepcopy(recipe)
  duplicate_recipe.name = "hand-crafted-"..recipe.name
  
  if not duplicate_recipe.localised_name then
    local main_product = util.get_recipe_main_product(recipe)
    if main_product then
      duplicate_recipe.localised_name = get_item_localised_name(main_product.name)
      for _,result in pairs(duplicate_recipe.results) do
        if result.name == main_product.name then
          result.probability = nil
        end
      end
    else
      duplicate_recipe.localised_name = {"recipe-name."..recipe.name}
    end
  end
  duplicate_recipe.localised_name = {"recipe-name.hand-crafted", duplicate_recipe.localised_name}
  duplicate_recipe.category = "hand-crafting"
  duplicate_recipe.hidden = true
  table.insert(handcraft_recipes, duplicate_recipe)
  handcraft_recipe_map[recipe.name] = duplicate_recipe.name
  return duplicate_recipe
end

--------------------------------------------------------------------------------------------------

for _,recipe in pairs(data.raw.recipe) do
  if can_modify_recipe(recipe) then
    local out = {
      byproducts = {},
      recipe_results = {},
      total_scrap = 0,
      success_penalty = 0
    }

    local recipe_metadata = ScrapIndustry.recipes[recipe.name] or {}
    local category_metadata = ScrapIndustry.categories[recipe.category or "crafting"] or {}
    if recipe_metadata.self_scrap or category_metadata.self_scrap then
      for _,result in pairs(recipe.results) do
        get_ingredient_scrap(result, out)
      end
    elseif recipe_metadata.fake_ingredients then
      for _,result in pairs(recipe_metadata.fake_ingredients) do
        get_ingredient_scrap(result, out)
      end
    else
      for _,result in pairs(recipe.results) do
        out.recipe_results[result.name] = true
      end
      for _,ingredient in pairs(recipe.ingredients or {}) do
        get_ingredient_scrap(ingredient, out)
      end
    end

    if recipe_metadata.failrate and type(recipe_metadata.failrate) == "number" then
      out.success_penalty = recipe_metadata.failrate
    elseif out.total_scrap > 0 then
      local failrate_scale = 1 / (out.total_scrap / (2*ScrapIndustry.LEGENDARY))
      if failrate_scale < 1 then
        out.success_penalty = math.max(math.ceil(failrate_scale * out.success_penalty * 100) / 100, global_failrate_min)
      end
      out.success_penalty = math.max(global_failrate_scale * out.success_penalty, global_failrate_min)
    end
  
    if out.success_penalty > 0 then
      for _,result in pairs(recipe.results) do
        if result.type == "item" then
          local new_probability = 1 - out.success_penalty
          if result.probability then
            result.probability = result.probability * new_probability
          else
            result.probability = new_probability
          end
        end
      end
    end

    if out.byproducts ~= {} then
      local excluded_result = ""
      if table_size(out.byproducts) > 3 then
        -- if there are a lot of scrap results, get rid of the least important one (biased by scrap amount)
        local lowest_priority = 1
        for scrap_name,scrap_amount in pairs(out.byproducts) do
          local scrap_metadata = ScrapIndustry.products[scrap_name]
          local priority = (scrap_metadata and scrap_metadata.priority or 1) + scrap_amount
          if priority < lowest_priority then
            lowest_priority = priority
            excluded_result = scrap_name
          end
        end
      end
      if not recipe.main_product then
        local main_product = util.get_recipe_main_product(recipe)
        if main_product then
          recipe.main_product = main_product.name
        end
      end
      for scrap_name,scrap_amount in pairs(out.byproducts) do
        if scrap_name ~= excluded_result and scrap_amount > 0 then
          local halved_amount = scrap_amount / 0.5
          local random_scale = 1 + 0.12 * (1 - 2 * math.random())
          local probability = math.floor(100 * random_scale * scrap_amount / math.ceil(halved_amount)) / 100
          local final_amount = halved_amount / 0.5
          if final_amount > 1 then final_amount = math.sqrt(final_amount) end
          local amount_min = math.max(1, math.floor(0.9 * final_amount + 0.5))
          local amount_max = math.max(1, math.floor(1.1 * final_amount + 0.5))
          local result = {type="item", name=scrap_name, probability=probability, show_details_in_recipe_tooltip=false}
          if amount_min ~= amount_max then
            result.amount_min = amount_min
            result.amount_max = amount_max
            result.ignored_by_productivity=amount_max
          else
            result.amount = math.ceil(final_amount)
            result.ignored_by_productivity=result.amount
          end
          table.insert(recipe.results, result)
        end
      end
    end

    if should_duplicate_for_hand_crafting(recipe, recipe_metadata, out) then
      duplicate_for_hand_crafting(recipe)
    end
  end
end

--------------------------------------------------------------------------------------------------

if table_size(handcraft_recipes) > 0 then
  if not handcraft_categories["hand-crafting"] then
    data:extend({
      {
        type = "recipe-category",
        name = "hand-crafting"
      }
    })
    table.insert(data.raw.character.character.crafting_categories, "hand-crafting")
  end
  for _,tech in pairs(data.raw.technology) do
    for _,effect in pairs(tech.effects or {}) do
      local new_recipe = effect.type == "unlock-recipe" and handcraft_recipe_map[effect.recipe]
      if new_recipe then
        table.insert(tech.effects, {type="unlock-recipe", recipe=new_recipe, hidden=true})
      end
    end
  end
  data:extend(handcraft_recipes)
end

-------------------------------------------------------------------------- Recycling recipe overrides

local default_machine_tints = {primary = {0.125,0.125,0.125,0.125}, secondary = {0.125,0.125,0.125,0.125}, tertiary = {0.125,0.125,0.125,0.125}, quaternary = {0.125,0.125,0.125,0.125}}

if mods["quality"] then
  for item_name,scrap_metadata in pairs(ScrapIndustry.items) do
    local item = data.raw.item[item_name]
    if item and scrap_metadata.recycle then
      local icons = generate_recycling_recipe_icons_from_item(item)
      local crafting_machine_tint = data.raw.recipe[item.name] and data.raw.recipe[item.name].crafting_machine_tint or default_machine_tints
      local amount = math.ceil(scrap_metadata.recycle/4)
      local probability = 0.25*(scrap_metadata.recycle/4)/amount
      probability = math.ceil(probability*1000)/1000
      data:extend({
        {
          type = "recipe",
          name = item.name.."-recycling",
          localised_name = {"recipe-name.recycling", get_item_localised_name(item.name)},
          icons = icons,
          category = "recycling",
          subgroup = item.subgroup,
          hidden = true,
          enabled = true,
          unlock_results = false,
          allow_decomposition = false,
          ingredients = {{type="item", name=item.name, amount=1, ignored_by_stats=1}},
          results = {{type="item", name=scrap_metadata.scrap, amount=amount, probability=probability, ignored_by_stats=1}},
          energy_required = (data.raw.recipe[item.name] and data.raw.recipe[item.name].energy_required or 0.5 )/16,
          crafting_machine_tint = crafting_machine_tint
        },
      })
    end
  end
end

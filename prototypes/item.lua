local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")

data:extend({
  {
    type = "item",
    name = "iron-scrap",
    icon = "__scrap-industry__/graphics/icons/iron-scrap.png",
    pictures = {
      {size = 64, filename = "__scrap-industry__/graphics/icons/iron-scrap.png",   scale = 0.5, mipmap_count = 4},
      {size = 64, filename = "__scrap-industry__/graphics/icons/iron-scrap-1.png", scale = 0.5, mipmap_count = 4},
      {size = 64, filename = "__scrap-industry__/graphics/icons/iron-scrap-2.png", scale = 0.5, mipmap_count = 4},
    },
    subgroup = "production-scrap",
    order = "a[material]-a[iron]",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    stack_size = 50,
    weight = 2*kg,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "copper-scrap",
    icon = "__scrap-industry__/graphics/icons/copper-scrap.png",
    pictures = {
      {size = 64, filename = "__scrap-industry__/graphics/icons/copper-scrap.png",   scale = 0.5, mipmap_count = 4},
      {size = 64, filename = "__scrap-industry__/graphics/icons/copper-scrap-1.png", scale = 0.5, mipmap_count = 4},
      {size = 64, filename = "__scrap-industry__/graphics/icons/copper-scrap-2.png", scale = 0.5, mipmap_count = 4},
    },
    subgroup = "production-scrap",
    order = "a[material]-b[copper]",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    stack_size = 50,
    weight = 2*kg
  },
  {
    type = "item",
    name = "steel-scrap",
    icon = "__scrap-industry__/graphics/icons/steel-scrap.png",
    pictures = {
      {size = 64, filename = "__scrap-industry__/graphics/icons/steel-scrap.png",   scale = 0.5, mipmap_count = 4},
      {size = 64, filename = "__scrap-industry__/graphics/icons/steel-scrap-1.png", scale = 0.5, mipmap_count = 4},
      {size = 64, filename = "__scrap-industry__/graphics/icons/steel-scrap-2.png", scale = 0.5, mipmap_count = 4},
    },
    subgroup = "production-scrap",
    order = "a[material]-c[steel]",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    stack_size = 50,
    weight = 2*kg
  },
  {
    type = "item",
    name = "circuit-scrap",
    icon = "__scrap-industry__/graphics/icons/circuit-scrap.png",
    pictures = {
      {size = 64, filename = "__scrap-industry__/graphics/icons/circuit-scrap.png",   scale = 0.5, mipmap_count = 4},
      {size = 64, filename = "__scrap-industry__/graphics/icons/circuit-scrap-1.png", scale = 0.5, mipmap_count = 4},
      {size = 64, filename = "__scrap-industry__/graphics/icons/circuit-scrap-2.png", scale = 0.5, mipmap_count = 4},
      {size = 64, filename = "__scrap-industry__/graphics/icons/circuit-scrap-3.png", scale = 0.5, mipmap_count = 4},
    },
    subgroup = "production-scrap",
    order = "c[product]-a[circuit]",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    weight = 2*kg
  }
})

if settings.startup["scrap-industry-plastic"].value then
  data:extend({
    {
      type = "item",
      name = "plastic-bits",
      icon = "__scrap-industry__/graphics/icons/plastic-bits.png",
      pictures = {
        {size = 64, filename = "__scrap-industry__/graphics/icons/plastic-bits.png",   scale = 0.5},
        {size = 64, filename = "__scrap-industry__/graphics/icons/plastic-bits-1.png", scale = 0.5},
        {size = 64, filename = "__scrap-industry__/graphics/icons/plastic-bits-2.png", scale = 0.5},
      },
      subgroup = "production-scrap",
      order = "c[product]-b[plastic]",
      inventory_move_sound = item_sounds.resource_inventory_move,
      pick_sound = item_sounds.resource_inventory_pickup,
      drop_sound = item_sounds.resource_inventory_move,
      stack_size = 50,
      weight = 2*kg
    }
  })
end

if settings.startup["scrap-industry-mech"].value then
  data:extend({
    {
		type = "item",
		name = "mech-scrap",
		icon = "__scrap-industry__/graphics/icons/mech-scrap.png",
		pictures = {
		{size = 64, filename = "__scrap-industry__/graphics/icons/mech-scrap.png",   scale = 0.5},
		{size = 64, filename = "__scrap-industry__/graphics/icons/mech-scrap-1.png", scale = 0.5},
		{size = 64, filename = "__scrap-industry__/graphics/icons/mech-scrap-2.png", scale = 0.5,},
		},
		subgroup = "production-scrap",
		order = "c[product]-c[mech]",
		inventory_move_sound = item_sounds.metal_small_inventory_move,
		pick_sound = item_sounds.metal_small_inventory_pickup,
		drop_sound = item_sounds.metal_small_inventory_move,
		stack_size = 50,
		weight = 2*kg
    }
  })
end

if mods["space-age"] then
  data:extend({
    {
      type = "item",
      name = "tungsten-scrap",
      icon = "__scrap-industry__/graphics/icons/tungsten-scrap.png",
      pictures = {
        {size = 64, filename = "__scrap-industry__/graphics/icons/tungsten-scrap.png",   scale = 0.5, mipmap_count = 4},
        {size = 64, filename = "__scrap-industry__/graphics/icons/tungsten-scrap-1.png", scale = 0.5, mipmap_count = 4},
        {size = 64, filename = "__scrap-industry__/graphics/icons/tungsten-scrap-2.png", scale = 0.5, mipmap_count = 4},
      },
      subgroup = "vulcanus-processes",
      order = "c[tungsten]-a[tungsten-scrap]",
      inventory_move_sound = item_sounds.metal_small_inventory_move,
      pick_sound = item_sounds.metal_small_inventory_pickup,
      drop_sound = item_sounds.metal_small_inventory_move,
      stack_size = 50,
      weight = 2*kg
    },
    {
      type = "item",
      name = "holmium-scrap",
      icon = "__scrap-industry__/graphics/icons/holmium-scrap.png",
      pictures = {
        {size = 64, filename = "__scrap-industry__/graphics/icons/holmium-scrap.png",   scale = 0.5, mipmap_count = 4},
        {size = 64, filename = "__scrap-industry__/graphics/icons/holmium-scrap-1.png", scale = 0.5, mipmap_count = 4},
        {size = 64, filename = "__scrap-industry__/graphics/icons/holmium-scrap-2.png", scale = 0.5, mipmap_count = 4},
      },
      subgroup = "fulgora-processes",
      order = "b[holmium]-a[holmium-scrap]",
      inventory_move_sound = item_sounds.metal_small_inventory_move,
      pick_sound = item_sounds.metal_small_inventory_pickup,
      drop_sound = item_sounds.metal_small_inventory_move,
      stack_size = 50,
      weight = 2*kg
    }
  })

  local volatile_lithium = settings.startup["scrap-industry-volatile-lithium"].value
  data:extend({
    {
      type = "item",
      name = "lithium-dust",
      icon = "__scrap-industry__/graphics/icons/lithium-powder.png",
      pictures = {
        {size = 64, filename = "__scrap-industry__/graphics/icons/lithium-powder.png",   scale = 0.5, mipmap_count = 4},
        {size = 64, filename = "__scrap-industry__/graphics/icons/lithium-powder-1.png", scale = 0.5, mipmap_count = 4},
      },
      subgroup = "aquilo-processes",
      order = "c[lithium]-c[lithium-powder]",
      inventory_move_sound = item_sounds.resource_inventory_move,
      pick_sound = item_sounds.resource_inventory_pickup,
      drop_sound = item_sounds.resource_inventory_move,
      stack_size = 50,
      weight = 2*kg,
      fuel_category = not volatile_lithium and "chemical" or nil,
      fuel_value = not volatile_lithium and "1MJ" or nil,
      spoil_ticks = volatile_lithium and 3*minute or nil,
      spoil_to_trigger_result = volatile_lithium and {
        items_per_trigger = 1,
        trigger = {
          type = "direct",
          action_delivery = {
            type = "instant",
            target_effects = {
              {
                type = "create-entity",
                entity_name = "explosion"
              },
              {
                type = "create-fire",
                entity_name = "lithium-flame",
                show_in_tooltip = true,
                as_enemy = true,
                initial_ground_flame_count = 2
              },
              {
                type = "nested-result",
                action = {
                  type = "area",
                  radius = 0.5,
                  action_delivery = {
                    type = "instant",
                    target_effects = {
                      type = "damage",
                      damage = {amount = 25, type = "explosion"}
                    }
                  }
                }
              }
            }
          }
        }
      } or nil
    }
  })
end

if mods["bzlead"] then
  data:extend({
    {
      type = "item",
      name = "lead-scrap",
      icon = "__scrap-industry__/graphics/icons/compat/lead-scrap.png",
      pictures = {
        {size = 64, filename = "__scrap-industry__/graphics/icons/compat/lead-scrap.png",   scale = 0.5, mipmap_count = 4},
        {size = 64, filename = "__scrap-industry__/graphics/icons/compat/lead-scrap-1.png", scale = 0.5, mipmap_count = 4},
        {size = 64, filename = "__scrap-industry__/graphics/icons/compat/lead-scrap-2.png", scale = 0.5, mipmap_count = 4},
      },
      subgroup = "production-scrap",
      order = "a[material]-d[lead]",
      inventory_move_sound = item_sounds.metal_small_inventory_move,
      pick_sound = item_sounds.metal_small_inventory_pickup,
      drop_sound = item_sounds.metal_small_inventory_move,
      stack_size = 50,
      weight = 2*kg
    },
  })
end

if mods["bztitanium"] then
  data:extend({
    {
      type = "item",
      name = "titanium-scrap",
      icon = "__scrap-industry__/graphics/icons/compat/titanium-scrap.png",
      pictures = {
        {size = 64, filename = "__scrap-industry__/graphics/icons/compat/titanium-scrap.png",   scale = 0.5, mipmap_count = 4},
        {size = 64, filename = "__scrap-industry__/graphics/icons/compat/titanium-scrap-1.png", scale = 0.5, mipmap_count = 4},
        {size = 64, filename = "__scrap-industry__/graphics/icons/compat/titanium-scrap-2.png", scale = 0.5, mipmap_count = 4},
      },
      subgroup = "production-scrap",
      order = "a[material]-e[titanium]",
      inventory_move_sound = item_sounds.metal_small_inventory_move,
      pick_sound = item_sounds.metal_small_inventory_pickup,
      drop_sound = item_sounds.metal_small_inventory_move,
      stack_size = 50,
      weight = 2*kg
    }
  })
end

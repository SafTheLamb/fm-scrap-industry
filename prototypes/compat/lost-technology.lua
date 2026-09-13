local frep = require("__fdsl__.lib.recipe")

if mods["lost-technology"] then
	local fulgoran_metal = data.raw.item["lost-scrap-iron"]
	if fulgoran_metal then
		fulgoran_metal.icon = "__scrap-industry__/graphics/icons/compat/fulgoran-metal.png"
		fulgoran_metal.pictures = nil
	end
	local fulgoran_metal_smelting = data.raw.recipe["lost-scrap-iron-recycling-early"]
	if fulgoran_metal_smelting and fulgoran_metal_smelting.icons then
		fulgoran_metal_smelting.icons[1].icon = "__scrap-industry__/graphics/icons/compat/fulgoran-metal.png"
	end
	frep.add_shared_probability_result("lost-scrap-iron-recycling", {type="item", name="iron-scrap", amount=1}, 0.1)
end

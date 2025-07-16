local frep = require("__fdsl__.lib.recipe")

if mods["bzlead"] then
  ScrapIndustry.products["lead-scrap"] = {priority=0.8}
  ScrapIndustry.items["lead-plate"] = {scrap="lead-scrap", scale=ScrapIndustry.COMMON, failrate=0.02, recycle=2}
  ScrapIndustry.items["lead-expansion-bolt"] = {scrap={"lead-scrap", "iron-scrap"}, scale=ScrapIndustry.COMMON, failrate=-0.01}
  
  if mods["space-age"] then
    ScrapIndustry.items["lead-lithium-eutectic"] = {scrap={"lead-scrap"}, scale=ScrapIndustry.UNCOMMON, failrate=0.01}
    table.insert(ScrapIndustry.items["lead-lithium-eutectic"].scrap, "lithium-dust")
  end
end

if mods["bztitanium"] then
  ScrapIndustry.products["titanium-scrap"] = {priority=3}
  ScrapIndustry.items["titanium-plate"] = {scrap="titanium-scrap", scale=ScrapIndustry.UNCOMMON, failrate=0.01, recycle=5}
  ScrapIndustry.recipes["titanium-sublimation"] = {ignore=true}
  table.insert(ScrapIndustry.items["low-density-structure"].scrap, "titanium-scrap")
end

if mods["bztin"] then
	frep.modify_ingredient("electronic-circuit-from-scrap", "circuit-scrap", {amount=3})
	frep.scale_ingredient("electronic-circuit-from-scrap", "copper-cable", {amount=2})
	frep.scale_result("electronic-circuit-from-scrap", "electronic-circuit", {amount=2})
	frep.add_ingredient("electronic-circuit-from-scrap", {type="item", name="solder", amount=1})

	if (settings.startup["scrap-industry-red-circuit-plastic"].value) then
		frep.modify_ingredient("advanced-circuit-from-scrap", "circuit-scrap", {amount=12})	
	else
		frep.modify_ingredient("advanced-circuit-from-scrap", "circuit-scrap", {amount=5})
		frep.modify_ingredient("advanced-circuit-from-scrap", "plastic-bar", {amount=2})
	end
	
	frep.modify_ingredient("advanced-circuit-from-scrap", "copper-cable", {amount=3})
	frep.scale_result("advanced-circuit-from-scrap", "advanced-circuit", {amount=2})
	frep.add_ingredient("advanced-circuit-from-scrap", {type="item", name="solder", amount=1})
end

local ftech = require("__fdsl__.lib.technology")

ftech.add_unlock("steel-processing", "steel-plate-from-scrap")
ftech.add_unlock("electronics", "electronic-circuit-from-scrap")
ftech.add_unlock("advanced-circuit", "advanced-circuit-from-scrap")
ftech.add_unlock("processing-unit", "processing-unit-from-scrap")
if mods["space-age"] then
  table.insert(data.raw.technology["steel-plate-productivity"].effects, {type="change-recipe-productivity", recipe="steel-plate-from-scrap", change=0.1})
  table.insert(data.raw.technology["processing-unit-productivity"].effects, {type="change-recipe-productivity", recipe="processing-unit-from-scrap", change=0.1})
end

if settings.startup["scrap-industry-mech"].value then
  ftech.add_unlock("engine", "engine-from-scrap")
end

if settings.startup["scrap-industry-plastic"].value then
  ftech.add_unlock("plastics", "plastic-bar-from-bits")
  if mods["space-age"] then
    ftech.add_unlock("bioflux-processing", "bioplastic-from-bits")
	  table.insert(data.raw.technology["plastic-bar-productivity"].effects, {type="change-recipe-productivity", recipe="plastic-bar-from-bits", change=0.1})
	  table.insert(data.raw.technology["plastic-bar-productivity"].effects, {type="change-recipe-productivity", recipe="bioplastic-from-bits", change=0.1})
  end
end

if mods["space-age"] then
  ftech.add_unlock("tungsten-carbide", "tungsten-carbide-from-scrap")
  ftech.add_unlock("metallurgic-science-pack", "tungsten-plate-from-scrap")
  ftech.add_unlock("holmium-processing", "holmium-solution-from-scrap")
  ftech.add_unlock("lithium-processing", "lithium-plate-from-powder")
  if settings.startup["scrap-industry-metallurgy"].value then
    ftech.add_unlock("foundry", "molten-iron-from-scrap")
    ftech.add_unlock("foundry", "molten-copper-from-scrap")
    ftech.add_unlock("foundry", "molten-iron-from-steel-scrap")
  end
end

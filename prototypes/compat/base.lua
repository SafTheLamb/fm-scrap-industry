-- Even I hesitate to enable this, but here it is
local mercy_mode = not settings.startup["scrap-industry-no-mercy"].value
local expensive_mode = mods["Expensive-Mode"]

ScrapIndustry.products["iron-scrap"] = {priority=1}
ScrapIndustry.products["copper-scrap"] = {priority=1}
ScrapIndustry.products["steel-scrap"] = {priority=2}

if settings.startup["scrap-industry-mech"].value then
	ScrapIndustry.products["mech-scrap"] = {priority=3}
	ScrapIndustry.items["iron-gear-wheel"] = {scrap="mech-scrap", scale=ScrapIndustry.COMMON, failrate=0.02}
else
	ScrapIndustry.items["iron-gear-wheel"] = {scrap="iron-scrap", scale=ScrapIndustry.PRODUCT, failrate=0.02}
end

ScrapIndustry.categories["smelting"] = {ignore=true}
ScrapIndustry.items["iron-plate"] = {scrap="iron-scrap", scale=ScrapIndustry.COMMON, failrate=0.01, recycle=2}
ScrapIndustry.items["iron-stick"] = {scrap="iron-scrap", scale=ScrapIndustry.CHEAP, failrate=0.02}
ScrapIndustry.items["pipe"] = {scrap="iron-scrap", scale=ScrapIndustry.COMMON, failrate=0.01}
ScrapIndustry.items["copper-plate"] = {scrap="copper-scrap", scale=ScrapIndustry.COMMON, failrate=0.01, recycle=2}
ScrapIndustry.items["copper-cable"] = {scrap="copper-scrap", scale=ScrapIndustry.COMMON, failrate=0.02}
ScrapIndustry.items["steel-plate"] = {scrap="steel-scrap", scale=ScrapIndustry.UNCOMMON, failrate=0.03, recycle=expensive_mode and 10 or 5}
if mercy_mode then
	ScrapIndustry.recipes["iron-gear-wheel"] = {ignore=true}
	ScrapIndustry.recipes["iron-stick"] = {ignore=true}
	ScrapIndustry.recipes["copper-cable"] = {ignore=true}
	ScrapIndustry.recipes["pipe"] = {ignore=true}
end

ScrapIndustry.products["stone"] = {priority=0.5}
ScrapIndustry.items["stone"] = {scrap="stone", scale=ScrapIndustry.CHEAP, failrate=0.03}
ScrapIndustry.items["stone-brick"] = {scrap="stone", scale=2*ScrapIndustry.CHEAP, failrate=0.02}
ScrapIndustry.items["concrete"] = {scrap="stone", scale=3*ScrapIndustry.CHEAP, failrate=0.01}
ScrapIndustry.items["refined-concrete"] = {scrap="stone", scale=4*ScrapIndustry.CHEAP}
ScrapIndustry.items["landfill"] = {scrap="stone", scale=5*ScrapIndustry.CHEAP, failrate=0.01}
ScrapIndustry.recipes["landfill"] = {ignore=true}
ScrapIndustry.recipes["hazard-concrete"] = {ignore=true}
ScrapIndustry.recipes["refined-hazard-concrete"] = {ignore=true}

ScrapIndustry.products["uranium-ore"] = {priority=5}
ScrapIndustry.items["uranium-238"] = {scrap="uranium-ore", scale=2*ScrapIndustry.FLAVOR, failrate=0.02}
ScrapIndustry.items["uranium-235"] = {scrap="uranium-ore", scale=3*ScrapIndustry.FLAVOR, failrate=0.01}
ScrapIndustry.recipes["kovarex-enrichment-process"] = {failrate=0}

ScrapIndustry.products["circuit-scrap"] = {priority=4}
ScrapIndustry.items["electronic-circuit"] = {scrap="circuit-scrap", scale=ScrapIndustry.COMMON, failrate=0.03}
ScrapIndustry.items["advanced-circuit"] = {scrap="circuit-scrap", scale=ScrapIndustry.UNCOMMON, failrate=0.02}
ScrapIndustry.items["processing-unit"] = {scrap="circuit-scrap", scale=ScrapIndustry.RARE, failrate=0.01}
ScrapIndustry.recipes["electronic-circuit"] = {self_scrap=true}
ScrapIndustry.recipes["advanced-circuit"] = {failrate=0.02}
ScrapIndustry.recipes["processing-unit"] = {failrate=0.01}

if settings.startup["scrap-industry-mech"].value then
	ScrapIndustry.recipes["engine-unit"] = {fake_ingredients = {{type="item", name="steel-plate", amount=1}, {type="item", name="engine-unit", amount=1}}}
	ScrapIndustry.items["engine-unit"] = {scrap={"mech-scrap"}, scale=ScrapIndustry.UNCOMMON, failrate=0.02}
	ScrapIndustry.items["electric-engine-unit"] = {scrap={"mech-scrap", "circuit-scrap"}, scale=ScrapIndustry.RARE, failrate=0.02}
	ScrapIndustry.items["flying-robot-frame"] = {scrap={"mech-scrap", "circuit-scrap"}, scale=ScrapIndustry.RARE, failrate=0.01}
else
	ScrapIndustry.items["engine-unit"] = {scrap={"iron-scrap", "steel-scrap"}, scale=ScrapIndustry.UNCOMMON, failrate=0.02}
	ScrapIndustry.items["electric-engine-unit"] = {scrap={"steel-scrap", "circuit-scrap"}, scale=ScrapIndustry.RARE, failrate=0.02}
	ScrapIndustry.items["flying-robot-frame"] = {scrap={"steel-scrap", "circuit-scrap"}, scale=ScrapIndustry.RARE, failrate=0.01}
end

ScrapIndustry.items["low-density-structure"] = {scrap={"copper-scrap", "steel-scrap"}, scale=ScrapIndustry.EXPENSIVE, failrate=0.01}
ScrapIndustry.recipes["assembling-machine-2"] = {failrate=0.02}

if settings.startup["scrap-industry-plastic"].value then
	ScrapIndustry.products["plastic-bits"] = {priority=3}
	ScrapIndustry.items["plastic-bar"] = {scrap="plastic-bits", scale=ScrapIndustry.COMMON, failrate=0.02}
	table.insert(ScrapIndustry.items["low-density-structure"].scrap, "plastic-bits")
	ScrapIndustry.items["raw-fish"] = {scrap="plastic-bits", scale=ScrapIndustry.FLAVOR, failrate=0.01} -- microplastics, it makes me sad too
end

ScrapIndustry.items["speed-module"] = {scrap="circuit-scrap", scale=ScrapIndustry.EXPENSIVE, failrate=-0.01}
ScrapIndustry.items["efficiency-module"] = {scrap="circuit-scrap", scale=ScrapIndustry.EXPENSIVE, failrate=-0.01}
ScrapIndustry.items["productivity-module"] = {scrap="circuit-scrap", scale=ScrapIndustry.EXPENSIVE, failrate=-0.01}
ScrapIndustry.items["speed-module-2"] = {scrap="circuit-scrap", scale=ScrapIndustry.EPIC, failrate=-0.02}
ScrapIndustry.items["efficiency-module-2"] = {scrap="circuit-scrap", scale=ScrapIndustry.EPIC, failrate=-0.02}
ScrapIndustry.items["productivity-module-2"] = {scrap="circuit-scrap", scale=ScrapIndustry.EPIC, failrate=-0.02}
ScrapIndustry.items["speed-module-3"] = {scrap="circuit-scrap", scale=ScrapIndustry.LEGENDARY, failrate=-0.03}
ScrapIndustry.items["efficiency-module-3"] = {scrap="circuit-scrap", scale=ScrapIndustry.LEGENDARY, failrate=-0.03}
ScrapIndustry.items["productivity-module-3"] = {scrap="circuit-scrap", scale=ScrapIndustry.LEGENDARY, failrate=-0.03}

ScrapIndustry.categories["rocket-building"] = {ignore=true}

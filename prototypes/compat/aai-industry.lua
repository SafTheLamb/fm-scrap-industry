if mods["aai-industry"] then
	-- overrides the data in prototypes.compat.base
	ScrapIndustry.products["sand"] = {priority=0.5}
	ScrapIndustry.items["stone"] = {scrap="sand", scale=ScrapIndustry.CHEAP, failrate=0.03}
	ScrapIndustry.items["stone-brick"] = {scrap="sand", scale=2*ScrapIndustry.CHEAP, failrate=0.02}
	ScrapIndustry.items["concrete"] = {scrap="sand", scale=3*ScrapIndustry.CHEAP, failrate=0.01}
	ScrapIndustry.items["refined-concrete"] = {scrap="sand", scale=4*ScrapIndustry.CHEAP}
	ScrapIndustry.items["glass"] = {scrap="sand", scale=ScrapIndustry.UNCOMMON, failrate=0.04}
	ScrapIndustry.items["landfill"] = {scrap="sand", scale=5*ScrapIndustry.CHEAP, failrate=0.01}
	ScrapIndustry.recipes["sand"] = {ignore=true}

	ScrapIndustry.items["motor"] = {scrap="iron-scrap", scale=ScrapIndustry.PRODUCT, failrate=0.02}
	ScrapIndustry.items["electric-motor"] = {scrap={"iron-scrap", "copper-scrap"}, scale=ScrapIndustry.PRODUCT, failrate=0.02}
	
	if settings.startup["scrap-industry-mech"].value then
		ScrapIndustry.items["engine-unit"] = {scrap={"mech-scrap"}, scale=ScrapIndustry.EXPENSIVE, failrate=0.01}
		ScrapIndustry.items["electric-engine-unit"] = {scrap={"mech-scrap", "circuit-scrap"}, scale=ScrapIndustry.RARE, failrate=0.01}
	else
		ScrapIndustry.items["engine-unit"] = {scrap={"iron-scrap", "steel-scrap"}, scale=ScrapIndustry.EXPENSIVE, failrate=0.01}
		ScrapIndustry.items["electric-engine-unit"] = {scrap={"iron-scrap", "steel-scrap", "circuit-scrap"}, scale=ScrapIndustry.RARE, failrate=0.01}
	end
end

for _,force in pairs(game.forces) do
	if settings.startup["scrap-industry-mech"].value then
		force.recipes["engine-from-scrap"].enabled = force.technologies["engine"].researched
	end
end
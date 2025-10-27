require("prototypes.recipe-final-fixes")

if mods["Rocs-Rusting-Iron"] then
  if data.raw.item["iron-scrap-rusty"] then
    data.raw.item["iron-scrap-rusty"].pictures = {
      {size = 64, filename = "__scrap-industry__/graphics/icons/compat/iron-scrap-rusty.png",   scale = 0.5, mipmap_count = 4},
      {size = 64, filename = "__scrap-industry__/graphics/icons/compat/iron-scrap-rusty-1.png", scale = 0.5, mipmap_count = 4},
      {size = 64, filename = "__scrap-industry__/graphics/icons/compat/iron-scrap-rusty-2.png", scale = 0.5, mipmap_count = 4},
    }
  end
end

if (settings.startup["scrap-industry-unhide-recipe-signals"].value) then
	for i in pairs(data.raw.item) do
		if (data.raw.recipe[i] and not data.raw.recipe[i].hidden) then
			data.raw.recipe[i].hide_from_signal_gui = false
		end
	end
end

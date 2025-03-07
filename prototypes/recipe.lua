data:extend({
  {
    type = "recipe",
    name = "iron-plate-from-scrap",
    localised_name = {"recipe-name.item-from-scrap", {"item-name.iron-plate"}},
    icons = {
      {icon="__scrap-industry__/graphics/icons/iron-scrap.png", shift={-12, -12}, scale=0.4},
      {icon="__base__/graphics/icons/iron-plate.png", draw_background=true}
    },
    category = "smelting",
    subgroup = "production-scrap",
    order = "b[smelting]-a[iron]",
    allow_productivity = true,
    auto_recycle = false,
    allow_decomposition = false,
    result_is_always_fresh = true,
    energy_required = 3.2,
    ingredients = {{type="item", name="iron-scrap", amount=2}},
    results = {{type="item", name="iron-plate", amount=1}}
  },
  {
    type = "recipe",
    name = "copper-plate-from-scrap",
    localised_name = {"recipe-name.item-from-scrap", {"item-name.copper-plate"}},
    icons = {
      {icon="__scrap-industry__/graphics/icons/copper-scrap.png", shift={-12, -12}, scale=0.4},
      {icon="__base__/graphics/icons/copper-plate.png", draw_background=true}
    },
    category = "smelting",
    subgroup = "production-scrap",
    order = "b[smelting]-b[copper]",
    allow_productivity = true,
    auto_recycle = false,
    allow_decomposition = false,
    energy_required = 3.2,
    ingredients = {{type="item", name="copper-scrap", amount=2}},
    results = {{type="item", name="copper-plate", amount=1}}
  },
  {
    type = "recipe",
    name = "steel-plate-from-scrap",
    localised_name = {"recipe-name.item-from-scrap", {"item-name.steel-plate"}},
    icons = {
      {icon="__scrap-industry__/graphics/icons/steel-scrap.png", shift={-12, -12}, scale=0.4},
      {icon="__base__/graphics/icons/steel-plate.png", draw_background=true}
    },
    category = "smelting",
    subgroup = "production-scrap",
    order = "b[smelting]-c[steel]",
    enabled = false,
    allow_productivity = true,
    auto_recycle = false,
    allow_decomposition = false,
    energy_required = 16,
    ingredients = {{type="item", name="steel-scrap", amount=mods["Expensive-Mode"] and 10 or 5}},
    results = {{type="item", name="steel-plate", amount=1}}
  },
  {
    type = "recipe",
    name = "electronic-circuit-from-scrap",
    localised_name = {"recipe-name.item-from-scrap", {"item-name.electronic-circuit"}},
    icons = {
      {icon="__scrap-industry__/graphics/icons/circuit-scrap-3.png", shift={-12, -12}, scale=0.4},
      {icon="__base__/graphics/icons/electronic-circuit.png", draw_background=true}
    },
    category = mods["space-age"] and "electronics" or "crafting",
    subgroup = "production-scrap",
    order = "d[crafting]-a[electronic-circuit]",
    enabled = false,
    allow_productivity = true,
    auto_recycle = false,
    allow_decomposition = false,
    energy_required = 1.5,
    ingredients = {
      {type="item", name="circuit-scrap", amount=2},
      {type="item", name="copper-cable", amount=mods["Expensive-Mode"] and 3 or 1}
    },
    results = {{type="item", name="electronic-circuit", amount=1}}
  },
  {
    type = "recipe",
    name = "advanced-circuit-from-scrap",
    localised_name = {"recipe-name.item-from-scrap", {"item-name.advanced-circuit"}},
    icons = {
      {icon="__scrap-industry__/graphics/icons/circuit-scrap-1.png", shift={-12, -12}, scale=0.4},
      {icon="__base__/graphics/icons/advanced-circuit.png", draw_background=true}
    },
    category = mods["space-age"] and "electronics" or "crafting",
    subgroup = "production-scrap",
    order = "d[crafting]-b[advanced-circuit]",
    enabled = false,
    allow_productivity = true,
    auto_recycle = false,
    allow_decomposition = false,
    energy_required = 9,
    ingredients = {
      {type="item", name="circuit-scrap", amount=3},
      {type="item", name="copper-cable", amount=mods["Expensive-Mode"] and 5 or 2},
      {type="item", name="plastic-bar", amount=mods["Expensive-Mode"] and 2 or 1}
    },
    results = {{type="item", name="advanced-circuit", amount=1}}
  }
})

if settings.startup["scrap-industry-plastic"].value then
  data:extend({
    {
      type = "recipe",
      name = "plastic-bar-from-bits",
      localised_name = {"recipe-name.plastic-bar-from-bits"},
      icons = {
        {icon="__scrap-industry__/graphics/icons/plastic-bits.png", shift={-12, -12}, scale=0.4},
        {icon="__base__/graphics/icons/plastic-bar.png", draw_background=true}
      },
      category = mods["space-age"] and "chemistry-or-cryogenics" or "chemistry",
      subgroup = "production-scrap",
      order = "d[crafting]-c[plastic-bar]",
      enabled = false,
      allow_productivity = true,
      auto_recycle = false,
      allow_decomposition = false,
      energy_required = 9,
      ingredients = {
        {type="item", name="plastic-bits", amount=3},
        {type="fluid", name="petroleum-gas", amount=10}
      },
      results = {{type="item", name="plastic-bar", amount=2}},
	  
		crafting_machine_tint = {
			primary = {r = 1.000, g = 1.000, b = 1.000, a = 1.000},
			secondary = {r = 0.771, g = 0.771, b = 0.771, a = 1.000}, 
			tertiary = {r = 0.8, g = 0.66, b = 0.8, a = 1.000},
			quaternary = {r = 0.55, g = 0.5, b = 0.55, a = 1.000},  
		}
	  
    }
  })
end

if mods["space-age"] then
  data:extend({
    {
      type = "recipe",
      name = "tungsten-carbide-from-scrap",
      localised_name = {"recipe-name.item-from-scrap", {"item-name.tungsten-carbide"}},
      icons = {
        {icon="__scrap-industry__/graphics/icons/tungsten-scrap.png", shift={-12, -12}, scale=0.4},
        {icon="__space-age__/graphics/icons/tungsten-carbide.png", draw_background=true}
      },
      category = mods["wood-industry"] and "kiln-smelting" or "crafting-with-fluid",
      subgroup = "vulcanus-processes",
      order = "c[tungsten]b-d[tungsten-carbide-from-scrap]",
      enabled = false,
      allow_productivity = true,
      auto_recycle = false,
      allow_decomposition = false,
      energy_required = 3.2,
      ingredients = {
        {type="item", name="tungsten-scrap", amount=mods["Expensive-Mode"] and 5 or 3},
        {type="item", name="carbon", amount=1},
        {type="fluid", name="sulfuric-acid", amount=10}
      },
      results = {{type="item", name="tungsten-carbide", amount=2}}
    },
    {
      type = "recipe",
      name = "tungsten-plate-from-scrap",
      localised_name = {"recipe-name.item-from-scrap", {"item-name.tungsten-plate"}},
      icons = {
        {icon="__scrap-industry__/graphics/icons/tungsten-scrap.png", shift={-12, -12}, scale=0.4},
        {icon="__space-age__/graphics/icons/tungsten-plate.png", draw_background=true}
      },
      category = "metallurgy",
      subgroup = "vulcanus-processes",
      order = "c[tungsten]b-e[tungsten-plate-from-scrap]",
      enabled = false,
      allow_productivity = true,
      auto_recycle = false,
      allow_decomposition = false,
      energy_required = 15,
      ingredients = {
        {type="item", name="tungsten-scrap", amount=mods["Expensive-Mode"] and 8 or 4},
        {type="fluid", name="molten-iron", amount=10}
      },
      results = {{type="item", name="tungsten-plate", amount=1}}
    },
    {
      type = "recipe",
      name = "holmium-solution-from-scrap",
      localised_name = {"recipe-name.item-from-scrap", {"fluid-name.holmium-solution"}},
      icons = {
        {icon="__scrap-industry__/graphics/icons/holmium-scrap.png", shift={-12, -12}, scale=0.4},
        {icon="__space-age__/graphics/icons/fluid/holmium-solution.png", draw_background=true}
      },
      category = "chemistry",
      subgroup = "fulgora-processes",
      order = "b[holmium]b-a[holmium-solution-from-scrap]",
      enabled = false,
      allow_productivity = true,
      auto_recycle = false,
      allow_decomposition = false,
      energy_required = 6.4,
      ingredients = {
        {type="item", name="holmium-scrap", amount=mods["Expensive-Mode"] and 5 or 3},
        {type="item", name=mods["aai-industry"] and "sand" or "stone", amount=1}
      },
      results = {{type="fluid", name="holmium-solution", amount=mods["aai-industry"] and 100 or 150}},
	  
		crafting_machine_tint =
		{
			  primary = {r = 0.598, g = 0.274, b = 0.501, a = 0.502}, -- #98457f80
			  secondary = {r = 0.524, g = 0.499, b = 0.521, a = 0.502}, -- #857f8480
			  tertiary = {r = 0.716, g = 0.716, b = 0.716, a = 0.502}, -- #b6b6b680
			  quaternary = {r = 0.768, g = 0.487, b = 0.684, a = 0.502}, -- #c37cae80
		}
	  
	  
    },
  })
  if settings.startup["scrap-industry-plastic"].value then
    data:extend({
      {
        type = "recipe",
        name = "bioplastic-from-bits",
        icons = {
          {icon="__space-age__/graphics/icons/yumako-mash.png", shift={4, -6}, scale=0.35, draw_background=true},
          {icon="__scrap-industry__/graphics/icons/bioplastic-from-bits-top.png", draw_background=true}
        },
        category = "organic",
        subgroup = "agriculture-products",
        order = "a[organic-products]-c[bioplastic]b",
        enabled = false,
        allow_productivity = true,
        auto_recycle = false,
        allow_decomposition = false,
        energy_required = 2,
        ingredients = {
          {type="item", name="plastic-bits", amount=3},
          {type="item", name="yumako-mash", amount=2}
        },
        results = {{type="item", name="plastic-bar", amount=2}}
      }
    })
  end
  if settings.startup["scrap-industry-lithium"].value then
    data:extend({
      {
        type = "recipe",
        name = "lithium-dust-neutralization",
        icons = {
          {icon="__base__/graphics/icons/fluid/sulfuric-acid.png", shift={-8, -14}, scale=0.4},
          {icon="__space-age__/graphics/icons/lithium.png", draw_background = true},
          {icon="__scrap-industry__/graphics/icons/lithium-dust-neutralization-top.png", draw_background=true}
        },
        category = "chemistry-or-cryogenics",
        subgroup = "aquilo-processes",
        order = "c[lithium]-e[lithium-dust-neutralization]",
        enabled = false,
        allow_productivity = true,
        auto_recycle = false,
        allow_decomposition = false,
        energy_required = 4,
        ingredients = {
          {type="item", name="lithium-dust", amount=1},
          {type="fluid", name="sulfuric-acid", amount=20}
        },
        results = {
          {type="item", name="lithium", amount=1, probability=0.47},
          {type="item", name="sulfur", amount=1, probability=0.03}
        },
        main_product = "lithium",
		
		crafting_machine_tint =
		{
		  primary = {r = 0.45, g = 0.8, b = 0.5, a = 1.000}, 
		  secondary = {r = 0.8, g = 0.9, b = 0.3, a = 1.000}, 
		  tertiary = {r = 0.876, g = 0.869, b = 0.597, a = 1.000}, 
		  quaternary = {r = 1.000, g = 1.000, b = 1.000, a = 1.000},
		}		
		
		
      }
    })
  end

  if settings.startup["scrap-industry-metallurgy"].value then
    data:extend({
      {
        type = "recipe",
        name = "molten-iron-from-scrap",
        localised_name = {"recipe-name.item-from-scrap", {"fluid-name.molten-iron"}},
        icons = {
          {icon="__scrap-industry__/graphics/icons/iron-scrap.png", shift={-8,-8}, scale=0.35},
          {icon="__space-age__/graphics/icons/fluid/molten-iron.png", draw_background=true}
        },
        category = "metallurgy",
        subgroup = "production-scrap",
        order = "e[melting]-a[molten-iron]",
        enabled = false,
        allow_productivity = true,
        auto_recycle = false,
        hide_from_signal_gui = false,
        ingredients = {
          {type="item", name="iron-scrap", amount=50},
          {type="item", name="calcite", amount=1}
        },
        energy_required = 64,
        results = {
          {type="fluid", name="molten-iron", amount=250}
        }
      },
      {
        type = "recipe",
        name = "molten-copper-from-scrap",
        localised_name = {"recipe-name.item-from-scrap", {"fluid-name.molten-copper"}},
        icons = {
          {icon="__scrap-industry__/graphics/icons/copper-scrap.png", shift={-8,-8}, scale=0.35},
          {icon="__space-age__/graphics/icons/fluid/molten-copper.png", draw_background=true}
        },
        category = "metallurgy",
        subgroup = "production-scrap",
        order = "e[melting]-b[molten-copper]",
        enabled = false,
        allow_productivity = true,
        auto_recycle = false,
        hide_from_signal_gui = false,
        ingredients = {
          {type="item", name="copper-scrap", amount=50},
          {type="item", name="calcite", amount=1}
        },
        energy_required = 64,
        results = {
          {type="fluid", name="molten-copper", amount=250}
        }
      },
      {
        type = "recipe",
        name = "molten-iron-from-steel-scrap",
        icons = {
          {icon="__scrap-industry__/graphics/icons/steel-scrap.png", shift={-8,-8}, scale=0.35},
          {icon="__space-age__/graphics/icons/fluid/molten-iron.png", draw_background=true}
        },
        category = "metallurgy",
        subgroup = "production-scrap",
        order = "e[melting]-c[molten-steel]",
        enabled = false,
        allow_productivity = true,
        auto_recycle = false,
        hide_from_signal_gui = false,
        ingredients = {
          {type="item", name="steel-scrap", amount=50}
        },
        energy_required = 64,
        results = {
          {type="fluid", name="molten-iron", amount=500}
        }
      },
    })
  end
end

if mods["Rocs-Rusting-Iron"] and settings.startup["scrap-industry-rust"].value then
  local derusting_material = mods["aai-industry"] and "sand" or "stone"
  data:extend({
    {
      type = "recipe",
      name = "rocs-rusting-iron-iron-scrap-derusting",
      localised_name = {"recipe-name.rocs-rusting-iron-derust", {"item-name.iron-scrap"}},
      icon = "__scrap-industry__/graphics/icons/iron-scrap-derust.png",
      icon_size = 64,
      order = "e[derusting]-A[derust-iron-scrap]",
      enabled = true,
      subgroup = "derusting",
      category = "crafting",
      energy_required = 1 / 4,
      ingredients = {
        {type="item", name="rocs-rusting-iron-iron-scrap-rusty", amount=1,ignored_by_stats=1},
        {type="item", name=derusting_material,amount=1}
      },
      results = {{type="item", name="iron-scrap", amount=1, ignored_by_productivity=1, ignored_by_stats=1}},
      allow_quality = false,
      result_is_always_fresh = true,
      allow_decomposition = false,
      allow_as_intermediate = false,
      always_show_made_in = true,
      auto_recycle = false
    },
    {
      type = "recipe",
      name = "rocs-rusting-iron-iron-scrap-chemical-derusting",
      localised_name = {"recipe-name.rocs-rusting-iron-chemical-derusting", {"item-name.iron-scrap"}},
      icons = {
        {icon="__scrap-industry__/graphics/icons/iron-scrap-derust.png", shift={2, 2}, scale=0.65},
        {icon="__base__/graphics/icons/fluid/sulfuric-acid.png", shift={-11, -11}, scale=0.45, draw_background=true}
      },
      order = "e[derusting]-A[chemical-derust-iron-scrap]",
      enabled = true,
      subgroup = "derusting",
      category = "chemistry",
      energy_required = 0.25,
      ingredients = {
        {type="item", name="rocs-rusting-iron-iron-scrap-rusty", amount=1, ignored_by_stats=1},
        {type="fluid", name="sulfuric-acid", amount=5},
        {type="fluid", name="water", amount=15}
      },
      results = {{type="item", name="iron-scrap", amount=1, ignored_by_productivity=1, ignored_by_stats=1}},
      crafting_machine_tint = {
        primary = {r=0.7, g=0.7, b=0.1},
        secondary = {r=0.8, g=0.8, b=0.1},
        tertiary = {r=0.7, g=0.7, b=0.1}
      },
      allow_quality = false,
      result_is_always_fresh = true,
      allow_decomposition = false,
      allow_as_intermediate = false,
      always_show_made_in = true,
      auto_recycle = false
    }
  })
end

if mods["bzlead"] then
  local needs_research = mods["aai-industry"] and mods["wood-industry"] and settings.startup["wood-industry-lead"].value
  data:extend({
    {
      type = "recipe",
      name = "lead-plate-from-scrap",
      localised_name = {"recipe-name.item-from-scrap", {"item-name.lead-plate"}},
      icons = {
        {icon="__scrap-industry__/graphics/icons/lead-scrap.png", shift={-12, -12}, scale=0.4},
        {icon="__bzlead__/graphics/icons/lead-plate.png", draw_background=true}
      },
      category = "smelting",
      subgroup = "production-scrap",
      order = "b[smelting]-d[lead]",
      enabled = not needs_research,
      allow_productivity = true,
      auto_recycle = false,
      allow_decomposition = false,
      energy_required = 6.4,
      ingredients = {{type="item", name="lead-scrap", amount=2}},
      results = {{type="item", name="lead-plate", amount=1}}
    },
  })
  if mods["space-age"] and settings.startup["scrap-industry-metallurgy"].value then
    data:extend({
      {
        type = "recipe",
        name = "molten-lead-from-scrap",
        localised_name = {"recipe-name.item-from-scrap", {"fluid-name.molten-lead"}},
        icons = {
          {icon="__scrap-industry__/graphics/icons/lead-scrap.png", shift={-8,-8}, scale=0.35},
          {icon="__bzlead__/graphics/icons/molten-lead-sa.png", draw_background=true}
        },
        category = "metallurgy",
        subgroup = "production-scrap",
        order = "e[melting]-d[molten-lead]",
        enabled = false,
        allow_productivity = true,
        auto_recycle = false,
        hide_from_signal_gui = false,
        ingredients = {
          {type="item", name="lead-scrap", amount=50},
          {type="item", name="calcite", amount=1}
        },
        energy_required = 64,
        results = {
          {type="fluid", name="molten-lead", amount=250}
        }
      }
    })
  end
end

if mods["bztitanium"] then
  data:extend({
    {
      type = "recipe",
      name = "titanium-plate-from-scrap",
      localised_name = {"recipe-name.item-from-scrap", {"item-name.titanium-plate"}},
      icons = {
        {icon="__scrap-industry__/graphics/icons/titanium-scrap.png", shift={-12, -12}, scale=0.4},
        {icon="__bztitanium__/graphics/icons/titanium-plate.png", draw_background=true}
      },
      category = "smelting",
      subgroup = "production-scrap",
      order = "b[smelting]-e[titanium]",
      enabled = false,
      allow_productivity = true,
      auto_recycle = false,
      allow_decomposition = false,
      energy_required = 6.4,
      ingredients = {{type="item", name="titanium-scrap", amount=5}},
      results = {{type="item", name="titanium-plate", amount=1}}
    },
  })
end

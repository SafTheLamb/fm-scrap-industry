data:extend({
  {
    type = "bool-setting",
    name = "scrap-industry-plastic",
    setting_type = "startup",
    default_value = true,
    order = "a[base]-b[plastic]"
  },
  {
    type = "bool-setting",
    name = "scrap-industry-mech",
    setting_type = "startup",
    default_value = true,
    order = "a[base]-c[mech]"
  },
  {
    type = "bool-setting",
    name = "scrap-industry-handcraft",
    setting_type = "startup",
    default_value = true,
    order = "m[misc]-a[handcraft]"
  },
  
  {
    type = "bool-setting",
    name = "scrap-industry-no-scrap-scrap",
    setting_type = "startup",
    default_value = false,
    order = "m[misc]-b[no-scrap-scrap]"
  },
  
  {
    type = "bool-setting",
    name = "scrap-industry-red-circuit-plastic",
    setting_type = "startup",
    default_value = false,
    order = "m[misc]-c[red-circuit-plastic]"
  },
  
  {
    type = "bool-setting",
    name = "scrap-industry-no-mercy",
    setting_type = "startup",
    default_value = false,
    order = "m[misc]-z[no-mercy]"
  },
  {
    type = "double-setting",
    name = "scrap-industry-byproduct-scale",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0.1,
    maximum_value = 2,
    order = "m[misc]-d[byproduct-scale]"
  },
  {
    type = "double-setting",
    name = "scrap-industry-failrate-scale",
    setting_type = "startup",
    default_value = 1,
    minimum_value = 0.1,
    maximum_value = 5,
    order = "m[misc]-e[failrate-scale]"
  },
  {
    type = "double-setting",
    name = "scrap-industry-failrate-min",
    setting_type = "startup",
    default_value = 0.01,
    minimum_value = 0,
    maximum_value = 0.2,
    order = "m[misc]-f[failrate-min]"
  },
})

if mods["space-age"] then
  data:extend({
    {
      type = "bool-setting",
      name = "scrap-industry-metallurgy",
      setting_type = "startup",
      default_value = true,
      order = "b[space-age]-a[metallurgy]"
    },
    {
      type = "bool-setting",
      name = "scrap-industry-volatile-lithium",
      setting_type = "startup",
      default_value = true,
      order = "b[space-age]-d[lithium]-b[volatile]"
    }
  })
end

if mods["Rocs-Rusting-Iron"] then
  data:extend({
    {
      type = "bool-setting",
      name = "scrap-industry-rust",
      setting_type = "startup",
      default_value = true,
      order = "c[mods]-a[rust]"
    }
  })
end

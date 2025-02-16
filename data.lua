require("api")

require("prototypes.compat.base")
if mods["space-age"] then
  require("prototypes.compat.space-age")
end
if mods["aai-industry"] then
  require("prototypes.compat.aai-industry")
end
require("prototypes.compat.bzores")
require("prototypes.compat.wood-universe")

require("prototypes.item-groups")
require("prototypes.item")
require("prototypes.recipe")

require("base-data-changes")

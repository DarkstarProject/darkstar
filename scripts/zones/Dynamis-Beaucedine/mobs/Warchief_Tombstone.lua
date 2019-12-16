-----------------------------------
-- Area: Dynamis - Beaucedine
--  Mob: Warchief Tombstone
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dynamis.timeExtensionOnDeath(mob, player, isKiller)
end

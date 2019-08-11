-----------------------------------
-- Area: Dynamis - Tavnazia
--  Mob: Statue Prototype
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dynamis.timeExtensionOnDeath(mob, player, isKiller)
end

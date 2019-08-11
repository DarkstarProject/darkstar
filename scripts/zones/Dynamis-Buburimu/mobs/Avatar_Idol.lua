-----------------------------------
-- Area: Dynamis - Buburimu
--  Mob: Avatar Idol
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dynamis.timeExtensionOnDeath(mob, player, isKiller)
end

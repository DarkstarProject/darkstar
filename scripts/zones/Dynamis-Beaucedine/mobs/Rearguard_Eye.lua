-----------------------------------
-- Area: Dynamis - Beaucedine
--  Mob: Rearguard Eye
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dynamis.timeExtensionOnDeath(mob, player, isKiller)
end

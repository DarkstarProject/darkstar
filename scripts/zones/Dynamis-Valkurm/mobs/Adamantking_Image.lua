-----------------------------------
-- Area: Dynamis - Valkurm
--  Mob: Adamantking Image
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dynamis.timeExtensionOnDeath(mob, player, isKiller)
end

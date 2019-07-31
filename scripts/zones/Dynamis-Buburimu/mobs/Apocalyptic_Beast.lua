-----------------------------------
-- Area: Dynamis - Buburimu
--  Mob: Apocalyptic Beast
-- Note: Mega Boss
-----------------------------------
require("scripts/globals/dynamis")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dynamis.megaBossOnDeath(mob, player, isKiller)
end

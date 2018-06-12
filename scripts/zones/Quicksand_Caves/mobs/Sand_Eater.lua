-----------------------------------
-- Area: Quicksand Caves
--  MOB: Sand Eater
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,814,1);
end;
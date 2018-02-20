-----------------------------------
-- Area: Quicksand Caves
--  MOB: Sand Tarantula
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,819,1);
end;
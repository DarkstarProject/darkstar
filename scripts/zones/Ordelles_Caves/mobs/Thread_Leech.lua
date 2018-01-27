-----------------------------------
-- Area: Ordelle's Caves
--  MOB: Thread Leech
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,655,2);
end;
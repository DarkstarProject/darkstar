-----------------------------------
-- Area: Ordelle's Caves
--  MOB: Vorpal Bunny
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,658,2);
end;
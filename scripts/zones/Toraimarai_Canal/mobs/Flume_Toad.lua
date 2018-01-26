-----------------------------------
-- Area: Toraimorai Canal
--  MOB: Flume Toad
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,625,1);
end;

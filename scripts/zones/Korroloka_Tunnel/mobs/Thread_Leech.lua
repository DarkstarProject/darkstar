-----------------------------------
-- Area: Korroloka Tunnel
--  MOB: Thread Leech
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,730,1);
end;
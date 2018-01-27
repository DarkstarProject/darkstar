-----------------------------------
-- Area: Korroloka Tunnel
--  MOB: Gigas Stonecarrier
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,733,1);
end;
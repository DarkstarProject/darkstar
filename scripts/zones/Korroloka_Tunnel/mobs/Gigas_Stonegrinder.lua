-----------------------------------
-- Area: Korroloka Tunnel
--  MOB: Gigas Stonegrinder
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,733,1);
end;
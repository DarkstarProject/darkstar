-----------------------------------
-- Area: Korroloka Tunnel
--  MOB: Gigas Foreman
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,733,1);
end;
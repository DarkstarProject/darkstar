-----------------------------------
-- Area: Korroloka Tunnel
--  MOB: Greater Pugil
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,731,2);
end;
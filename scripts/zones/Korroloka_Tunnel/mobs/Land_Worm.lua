-----------------------------------
-- Area: Korroloka Tunnel
--  MOB: Land Worm
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,727,1);
end;
-----------------------------------
-- Area: Korroloka Tunnel
--  MOB: Combat
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,728,2);
end;
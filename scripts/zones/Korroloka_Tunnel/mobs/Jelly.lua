-----------------------------------
-- Area: Korroloka Tunnel
--  MOB: Jelly
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,729,2);
end;
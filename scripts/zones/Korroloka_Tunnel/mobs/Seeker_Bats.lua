-----------------------------------
-- Area: Korroloka Tunnel
--  MOB: Seeker Bats
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,727,2);
    checkGoVregime(player,mob,728,1);
end;
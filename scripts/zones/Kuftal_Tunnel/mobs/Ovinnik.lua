-----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Ovinnik
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,741,1);
end;
-----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Kuftal Delver
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,742,1);
end;
-----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Haunt
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,736,2);
end;
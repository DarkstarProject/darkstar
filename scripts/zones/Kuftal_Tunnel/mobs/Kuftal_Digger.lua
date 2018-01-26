-----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Kuftal Digger
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,739,1);
end;
-----------------------------------
-- Area: Ve'Lugannon Palace
--  MOB: Dustbuster
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,743,1);
    checkGoVregime(player,mob,745,1);
end;
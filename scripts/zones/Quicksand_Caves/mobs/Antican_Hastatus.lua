-----------------------------------
-- Area: Quicksand Caves
--  MOB: Antican Hastatus
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,812,2);
    checkGoVregime(player,mob,813,2);
    checkGoVregime(player,mob,814,2);
    checkGoVregime(player,mob,815,1);
    checkGoVregime(player,mob,816,2);
    checkGoVregime(player,mob,817,2);
    checkGoVregime(player,mob,818,2);
    checkGoVregime(player,mob,819,2);
end;
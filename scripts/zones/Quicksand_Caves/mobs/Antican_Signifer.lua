-----------------------------------
-- Area: Quicksand Caves
--  MOB: Antican Signifer
-----------------------------------

require("scripts/zones/Quicksand_Caves/MobIDs");
require("scripts/globals/groundsofvalor");
require("scripts/globals/mobs");

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

function onMobDespawn(mob)
    phOnDespawn(mob,CENTURIO_X_I_PH,5,9000); -- 2,5 hours
end;

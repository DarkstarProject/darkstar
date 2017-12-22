-----------------------------------
-- Area: Quicksand Caves
--  MOB: Antican Princeps
-- Note: PH for Sagittarius X-XIII
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
    phOnDespawn(mob,Sagittarius_X_XIII_PH,10,14400); -- 4 hours
end;

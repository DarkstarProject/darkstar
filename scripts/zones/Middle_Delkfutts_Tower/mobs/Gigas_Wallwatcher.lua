-----------------------------------
-- Area: Middle Delkfutt's Tower
--  MOB: Gigas Wallwatcher
-- Note: PH for Ogygos
-----------------------------------
require("scripts/zones/Middle_Delkfutts_Tower/MobIDs");
require("scripts/globals/groundsofvalor");
require("scripts/globals/mobs");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,783,1);
    checkGoVregime(player,mob,784,2);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,OGYGOS_PH,5,math.random(7200,14400)); -- 2 to 4 hours
end;

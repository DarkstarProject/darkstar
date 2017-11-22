-----------------------------------
-- Area: Buburimu Peninsula (118)
--  MOB: Zu
-- Note: PH for Helldiver
-----------------------------------
require("scripts/zones/Buburimu_Peninsula/MobIDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    phOnDespawn(mob,HELLDIVER_PH,5,math.random(3600,28800)); -- 1 to 8 hours
end;

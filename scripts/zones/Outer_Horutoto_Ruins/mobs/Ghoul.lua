-----------------------------------
-- Area: Outer Horutoto Ruins   
--  MOB: Ghoul
-- Note: Place holder for Ah Puch
-----------------------------------
require("scripts/zones/Outer_Horutoto_Ruins/MobIDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    phOnDespawn(mob,AH_PUCH_PH,20,math.random(3600,10800)); -- 1 to 3 hours
end;

-----------------------------------
-- Area: Konschtat Highlands
--  MOB: Mad Sheep
-- Note: Place holder Stray Mary
-----------------------------------
require("scripts/zones/Konschtat_Highlands/MobIDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    phOnDespawn(mob,STRAY_MARY_PH,5,math.random(300,3600)); -- 5-60 minutes
end;

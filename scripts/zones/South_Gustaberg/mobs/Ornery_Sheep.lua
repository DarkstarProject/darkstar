----------------------------------
-- Area: South Gustaberg
--  MOB: Ornery Sheep
-- Note: Place holder Carnero
-----------------------------------
require("scripts/zones/South_Gustaberg/MobIDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    phOnDespawn(mob,CARNERO_PH,5,math.random(300,3600)); -- 5-60 minutes
end;

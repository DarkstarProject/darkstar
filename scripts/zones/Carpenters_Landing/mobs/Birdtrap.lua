-----------------------------------
-- Area: Carpenters' Landing
--  MOB: Birdtrap
-- Note: Placeholder Orctrap
-----------------------------------
require("scripts/zones/Carpenters_Landing/MobIDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    phOnDespawn(mob,ORCTRAP_PH,5,math.random(3600,25200)); -- 1 to 7 hours
end;

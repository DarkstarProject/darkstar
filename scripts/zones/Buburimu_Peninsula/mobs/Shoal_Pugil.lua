-----------------------------------
-- Area: Buburimu Peninsula (118)
--  MOB: Shoal Pugil
-- Note: PH for Buburimboo
-----------------------------------
require("scripts/zones/Buburimu_Peninsula/MobIDs");
require("scripts/globals/fieldsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,62,1);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,BUBURIMBOO_PH,5,math.random(3600,7200)); -- 1 to 2 hours
end;

-----------------------------------
-- Area: Beaucedine Glacier (111)
--  Mob:  Stone_Golem
-- Note: PH for Gargantua
-----------------------------------
require("scripts/zones/Beaucedine_Glacier/MobIDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    phOnDespawn(mob,GARGANTUA_PH,5,math.random(3600,25200)); -- 1 to 7 hours
end;

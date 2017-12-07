-----------------------------------
-- Area: Ghelsba Outpost (140)
--  MOB: Orcish_Grunt
-- Note: PH for Thousandarm Deshglesh
-----------------------------------
require("scripts/zones/Ghelsba_Outpost/MobIDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    phOnDespawn(mob,THOUSANDARM_DESHGLESH_PH,5,math.random(3600,10800)); -- 1 to 3 hours
end;

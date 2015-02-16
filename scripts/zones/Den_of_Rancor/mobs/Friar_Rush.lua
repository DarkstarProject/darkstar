-----------------------------------	
-- Area: Den of Rancor	
-- MOB:  Friar Rush	
-----------------------------------	
	
require("/scripts/globals/fieldsofvalor");
package.loaded["scripts/zones/Den_of_Rancor/TextIDs"] = nil;
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/monstertpmoves");
-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
	
end;

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
	mob:addMod(MOD_ACC,400);
	mob:addMod(MOD_DOUBLE_ATTACK,15);
end;	
	
-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,60,3);
	
end;	

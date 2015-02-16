-----------------------------------	
-- Area: Pashhow Marshlands	
-- MOB:  BoWho Warmonger	
-----------------------------------	
	
require("/scripts/globals/fieldsofvalor");
require("scripts/zones/Pashhow_Marshland/MobIDs");
package.loaded["scripts/zones/Pashhow_Marshland/TextIDs"] = nil;
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

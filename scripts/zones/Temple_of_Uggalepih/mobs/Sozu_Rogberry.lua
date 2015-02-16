-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  Sozu Rogberry
-----------------------------------

-----------------------------------	
	
require("/scripts/globals/fieldsofvalor");
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
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
	mob:addMod(MOD_REGAIN,33);
	mob:addMod(MOD_ACC,100);	
	mob:addMod(MOD_ATT,150);		
	mob:addMod(MOD_EVA,-150);	
	mob:addMod(MOD_TRIPLE_ATTACK,15);
end;	
	
-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- onMobFight
-----------------------------------
function onMobFight(mob,target)
    local MobHP = mob:getHPP();
	if (MobHP < 75) then
		mob:addStatusEffect(EFFECT_HASTE,1,0,60);
	end
end

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)

	killer:addTitle(TALKS_WITH_TONBERRIES);
	
	kills = killer:getVar("EVERYONES_GRUDGE_KILLS");
	if(kills < 480) then
		killer:setVar("EVERYONES_GRUDGE_KILLS",kills + 1);
	end
end;
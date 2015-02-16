-----------------------------------
-- Area:Uleguerland Range
-- NPC:  Bonnacon
-----------------------------------

require("scripts/globals/titles");
require("/scripts/globals/fieldsofvalor");
package.loaded["scripts/zones/Uleguerland_Range/TextIDs"] = nil;
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
	mob:addMod(MOD_DOUBLE_ATTACK,15);
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
		mob:addStatusEffect(EFFECT_HASTE,1,0,6000);
	end
end

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	
		checkRegime(killer,mob,60,3);
		killer:addTitle(HOT_DOG);
end;	
-----------------------------------
--  Area: Abyssea - Altepa (218)
--   Mob: Hazhdiha
-----------------------------------

-- require("scripts/zones/Abyssea-Altepa/MobIDs");
package.loaded["scripts/zones/Abyssea-Altepa/TextIDs"] = nil;
require("scripts/globals/status");
require("scripts/globals/magic");
-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)	
end;

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
	mob:addMod(MOD_MATT,175);
	mob:addMod(MOD_MACC,500);
	mob:addMod(MOD_EVA,-150);	
	mob:addMod(MOD_DEF,-200);
	mob:addMod(MOD_STR,50);	
	mob:addMod(MOD_REGAIN,33);	
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
		mob:addStatusEffect(EFFECT_HASTE,1,0,500);
	end
	
	if (MobHP < 15) then
		mob:addStatusEffect(EFFECT_MIGHTY_STRIKES,1,0,50);
	end
end

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	
end;


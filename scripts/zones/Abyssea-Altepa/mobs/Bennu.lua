-----------------------------------
--  Area: Abyssea - Altepa (218)
--   Mob: Bennu
-----------------------------------
-- require("scripts/zones/Abyssea-Altepa/MobIDs");
require("scripts/globals/status");
-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)	
end;

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
	mob:addMod(MOD_MATT,375);
	mob:addMod(MOD_MACC,500);
	mob:addMod(MOD_EVA,-200);
	mob:addMod(MOD_REGAIN,33);	
	mob:addMod(MOD_DEF,-150);
	mob:addMod(MOD_STR,-63);
	mob:addMod(MOD_ATT,183);
	mob:addMod(MOD_DOUBLE_ATTACK,25);
	mob:addMod(MOD_AGI,83);	
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


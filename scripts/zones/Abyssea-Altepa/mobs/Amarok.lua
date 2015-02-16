-----------------------------------
--  Area: Abyssea - Altepa (218)
--   Mob: Amarok
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
	mob:addMod(MOD_MATT,175);
	mob:addMod(MOD_MACC,500);
	mob:addMod(MOD_EVA,-200);	
	mob:addMod(MOD_ACC,250);
	mob:addMod(MOD_REGAIN,33);	
	mob:addMod(MOD_ATT,-100);
	mob:addMod(MOD_DEF,-150);	
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
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	
end;


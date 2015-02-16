-----------------------------------
--  Area: Abyssea - Altepa (218)
--   Mob: Ansherekh
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
	mob:addMod(MOD_ATT,-75);
	mob:addMod(MOD_MACC,500);
	mob:addMod(MOD_EVA,-150);	
	mob:addMod(MOD_DEF,-100);	
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


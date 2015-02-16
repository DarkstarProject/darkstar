-----------------------------------
--  Area: Abyssea - Altepa (218)
--   Mob: Ouzelum
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
	mob:addMod(MOD_MATT,15);
	mob:addMod(MOD_MACC,500);
	mob:addMod(MOD_EVA,-150);
	mob:addMod(MOD_DEF,-75);	
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


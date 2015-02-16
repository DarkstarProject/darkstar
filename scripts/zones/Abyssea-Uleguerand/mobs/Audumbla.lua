-----------------------------------
--  Area: Abyssea - Uleguerand (253)
--   Mob: Audumbla
-----------------------------------

-- require("scripts/zones/Abyssea-Uleguerand/MobIDs");

-----------------------------------
-- OnMobInitialize
-----------------------------------

function onMobInitialize(mob)	
end;

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)	
	mob:addMod(MOD_MACC,500);
	mob:addMod(MOD_EVA,-100);
	mob:addMod(MOD_DEF,-200);	
	mob:addMod(MOD_REGAIN,20);
	mob:addMod(MOD_DOUBLE_ATTACK,35);	
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


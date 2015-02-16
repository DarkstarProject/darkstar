-----------------------------------
--  Area: Abyssea - Uleguerand (253)
--   Mob: Apademak
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
	mob:addMod(MOD_MATT,75);
	mob:addMod(MOD_MACC,500);
	mob:addMod(MOD_EVA,-200);
	mob:addMod(MOD_DEF,-200);
	mob:addMod(MOD_REGAIN,33);	
	mob:addMod(MOD_MEVA,-50);
	mob:addMod(MOD_MDEF,-100);	
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


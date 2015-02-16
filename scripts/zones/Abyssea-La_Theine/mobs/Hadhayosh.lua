-----------------------------------
--  Area: Abyssea - La Theine (132)
--   Mob: Hadhayosh
-----------------------------------

-- require("scripts/zones/Abyssea-La_Theine/MobIDs");

-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)	
end;

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
	mob:addMod(MOD_MATT,35);
	mob:addMod(MOD_MACC,200);
	mob:addMod(MOD_EVA,-32);
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
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	
end;


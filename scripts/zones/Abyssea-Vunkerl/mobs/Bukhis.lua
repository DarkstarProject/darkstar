-----------------------------------
--  Area: Abyssea - Vunkerl (217)
--   Mob: Bukhis
-----------------------------------

-- require("scripts/zones/Abyssea-Vunkerl/MobIDs");

-----------------------------------
-- OnMobInitialize
-----------------------------------

function onMobInitialize(mob)
	mob:addMod(MOD_ATT,90);
	mob:addMod(MOD_ACC,90);
	mob:addMod(MOD_MATT,90);	
	mob:addMod(MOD_DEF,175);
	mob:addMod(MOD_MACC,500);
    mob:addMod(MOD_REGAIN,33);	
end;

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)	
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


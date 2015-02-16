-----------------------------------
--  Area: Abyssea - La Theine (132)
--   Mob: Briareus
-----------------------------------

-- require("scripts/zones/Abyssea-La_Theine/MobIDs");
package.loaded["scripts/zones/Abyssea-La_Theinex/TextIDs"] = nil;
require("scripts/globals/status");
require("scripts/globals/magic");
-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
	mob:addMod(MOD_MACC,300);
	mob:addMod(MOD_MEVA,100);
	mob:addMod(MOD_EVA,-77);
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


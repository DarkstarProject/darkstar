-----------------------------------
--  Area: Abyssea - Attohwa (215)
--   Mob: Blazing_Eruca
-----------------------------------
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
	mob:addMod(MOD_MATT,10);
	mob:addMod(MOD_MACC,500);
	mob:addMod(MOD_REGAIN,33);
	--mob:addMod(MOD_EVA,-100);	
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


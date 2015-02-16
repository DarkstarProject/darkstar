-----------------------------------
--  Area: Abyssea - Tahrongi (45)
--   Mob: Caoineag
-----------------------------------

-- require("scripts/zones/Abyssea-Tahrongi/MobIDs");
package.loaded["scripts/zones/Abyssea-Tahrongi/TextIDs"] = nil;
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
	mob:addMod(MOD_MATT,275);
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


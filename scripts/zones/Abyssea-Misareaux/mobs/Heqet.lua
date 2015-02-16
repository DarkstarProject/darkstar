-----------------------------------
--  Area: Abyssea - Misareaux (216)
--   Mob: Heqet
-----------------------------------

-- require("scripts/zones/Abyssea-Misareaux/MobIDs");
package.loaded["scripts/zones/Abyssea-Misareaux/TextIDs"] = nil;
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
	mob:addMod(MOD_MATT,5);
	mob:addMod(MOD_MACC,300);
	mob:addMod(MOD_MEVA,100);
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


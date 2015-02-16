-----------------------------------
--  Area: Abyssea - Attohwa (215)
--   Mob: Drekavac
-----------------------------------

-- require("scripts/zones/Abyssea-Attohwa/MobIDs");
package.loaded["scripts/zones/Abyssea-Attohwa/TextIDs"] = nil;
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
	mob:addMod(MOD_INT,90);
	mob:addMod(MOD_MATT,375);
	mob:addMod(MOD_MACC,500);
	mob:addMod(MOD_MEVA,200);
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


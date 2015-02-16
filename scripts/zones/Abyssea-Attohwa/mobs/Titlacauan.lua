-----------------------------------
--  Area: Abyssea - Attohwa (215)
--   Mob: Titlacauan
-----------------------------------
package.loaded["scripts/globals/abyssea"] = nil;
require("scripts/zones/Abyssea-Attohwa/MobIDs");
require("scripts/zones/Abyssea-Attohwa/textIDs");
require("scripts/globals/status");
require("scripts/globals/magic");
-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)	
	mob:addMod(MOD_MATT,15);
	mob:addMod(MOD_MACC,500);
	mob:addMod(MOD_MEVA,120);
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


-----------------------------------
--  Area: Abyssea - Vunkerl (217)
--   Mob: Sedna
-----------------------------------

package.loaded["scripts/globals/abyssea"] = nil;
require("scripts/zones/Abyssea-Vunkerl/MobIDs");
require("scripts/zones/Abyssea-Vunkerl/textIDs");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)	
	mob:addMod(MOD_MATT,100);
	mob:addMod(MOD_MACC,500);
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


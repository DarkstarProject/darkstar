-----------------------------------
--  Area: Abyssea - Attohwa (215)
--   Mob: Amun
-----------------------------------

-- require("scripts/zones/Abyssea-Attohwa/MobIDs");

package.loaded["scripts/globals/abyssea"] = nil;
require("scripts/zones/Abyssea-Attohwa/MobIDs");
require("scripts/zones/Abyssea-Attohwa/textIDs");
require("scripts/globals/abyssea");
require("scripts/globals/status");
-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)	
end;

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
	mob:addMod(MOD_INT,2);
	mob:addMod(MOD_MATT,15);
	mob:addMod(MOD_ATT,100);	
	mob:addMod(MOD_MACC,500);
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


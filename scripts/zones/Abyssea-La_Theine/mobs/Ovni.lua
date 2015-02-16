-----------------------------------
--  Area: Abyssea - La Theine (132)
--   Mob: Ovni
-----------------------------------

-- require("scripts/zones/Abyssea-La_Theine/MobIDs");
package.loaded["scripts/zones/Abyssea-La_Theine/TextIDs"] = nil;
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
	mob:hideName(true);
    mob:untargetable(true);
    mob:AnimationSub(5);
	mob:addMod(MOD_MATT,600);
	mob:addMod(MOD_MACC,300);
	mob:addMod(MOD_REGAIN,33);	
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
	mob:hideName(false);
    mob:untargetable(false);
    mob:AnimationSub(6);
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


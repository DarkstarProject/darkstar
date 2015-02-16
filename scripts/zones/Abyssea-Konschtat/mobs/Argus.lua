-----------------------------------
--  Area: Abyssea - Konschtat (15)
--   Mob: Argus
-----------------------------------
package.loaded["scripts/globals/abyssea"] = nil;
-----------------------------------

require("scripts/zones/Abyssea-Konschtat/textIDs");
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

function onMobDeathEx(mob, killer, isWeaponSkillKill, action)
	-- DoExp(mob,killer);
	-- DoCruor(mob,killer);
    -- DoLights(killer,mob,action)
	-- PyxisSpawn(mob,killer,npc);
end;
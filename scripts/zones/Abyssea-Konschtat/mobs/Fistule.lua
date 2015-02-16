-----------------------------------
--  Area: Abyssea - Konschtat (15)
--   Mob: Fistule
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
	mob:addMod(MOD_REGAIN,15);
	mob:addMod(MOD_DOUBLE_ATTACK,15);
	mob:addMod(MOD_MATT,100);
	mob:addMod(MOD_MACC,200);
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
    local MobHP = mob:getHPP();
	if (MobHP < 75) then
		mob:addStatusEffect(EFFECT_HASTE,1,0,50);
	end
end

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)

	local result = -- DoCruor(killer,result);
	-- DoExp(killer,bonus);
    -- DoLights(mob,killer);
	PyxisSpawn(mob,killer,npc);

	killer:messageSpecial(CRUOR_OBTAINED,result);
end;
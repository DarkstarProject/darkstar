-----------------------------------
-- Area: Ifrit's Cauldron
-- NPC:  Ash Dragon
-----------------------------------

require("scripts/globals/titles");
require("/scripts/globals/fieldsofvalor");
package.loaded["scripts/zones/Ifrits_Cauldron/TextIDs"] = nil;
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/monstertpmoves");
-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
	
end;

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
	mob:addMod(MOD_STR,7);
	mob:addMod(MOD_DEX,5);
	mob:addMod(MOD_ACC,200);
	mob:addMod(MOD_REGAIN,33);
	mob:addMod(MOD_DOUBLE_ATTACK,15);
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
		mob:addStatusEffect(EFFECT_HASTE,1,0,6000);
	end
end

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
    killer:addTitle(DRAGON_ASHER);
    
    -- Set ASh Dragon's spawnpoint and respawn time (21-24 hours))
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random((75600),(86400)));
end;
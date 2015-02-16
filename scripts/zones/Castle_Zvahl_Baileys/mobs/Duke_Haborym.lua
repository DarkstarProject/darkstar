-----------------------------------
--  Area: Castle Zvahl Baileys (161)
--    NM: Duke_Haborym
-----------------------------------

require("/scripts/globals/fieldsofvalor");
require("scripts/zones/Castle_Zvahl_Baileys/MobIDs");
package.loaded["scripts/zones/Castle_Zvahl_Baileys/TextIDs"] = nil;
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/monstertpmoves");
-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
	mob:setMobMod(MOBMOD_SIGHT_RANGE,30);
	mob:setMobMod(MOBMOD_SOUND_RANGE,30);
end;

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
	mob:addMod(MOD_STR,7);
	mob:addMod(MOD_DEX,5);
	mob:addMod(MOD_ATT,200);
	mob:addMod(MOD_ACC,100);
	mob:addMod(MOD_MACC,400);	
	mob:addMod(MOD_REGAIN,33);
	mob:addMod(MOD_TRIPLE_ATTACK,15);
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

function onMobDeath(mob,killer)	

	killer:addTitle(SMITER_OF_THE_SHADOW);
	
    -- Set Duke_Haborym's spawnpoint and respawn time (21-24 hours)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random(75600, 86400));

end;

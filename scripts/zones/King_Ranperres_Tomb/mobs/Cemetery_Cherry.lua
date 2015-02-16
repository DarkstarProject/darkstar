-----------------------------------
-- Area: King Ranperres Tomb
-- NPC:  Cemetery Cherry
-- @pos 33.000 0.500 -287.000 190
-----------------------------------

require("scripts/globals/titles");
require("/scripts/globals/fieldsofvalor");
package.loaded["scripts/zones/King_Ranperres_Tomb/TextIDs"] = nil;
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
	mob:addMod(MOD_STR,77);
	mob:addMod(MOD_INT,30);
	mob:addMod(MOD_MATT,400);
	mob:addMod(MOD_MACC,400);
	mob:addMod(MOD_DEX,77);
	mob:addMod(MOD_DMGPHYS,77);
	mob:addMod(MOD_ATT,412);
	mob:addMod(MOD_ACC,400);
	mob:addMod(MOD_EVA,132);
	mob:addMod(MOD_REGAIN,33);
	mob:addMod(MOD_CRIT_DMG_INCREASE,15);
	mob:addMod(MOD_CRITHITRATE,22);
	mob:addMod(MOD_DOUBLE_ATTACK,35);
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
	killer:addTitle(MON_CHERRY);
end;
-----------------------------------
-- Area: VeLugannon Palace
--  NM:  Brigandish Blade
-----------------------------------
require("scripts/zones/VeLugannon_Palace/MobIDs");
require("scripts/globals/settings");
require("scripts/globals/status");

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_ADD_EFFECT,mob:getShortID());
end;

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
end;

function onAdditionalEffect(mob,target,damage)
    local rand = math.random(1,10);
    if ((rand >= 4) or (target:hasStatusEffect(EFFECT_TERROR) == true)) then -- 30% chance to terror
        return 0,0,0;
    else
        local duration = math.random(3,5);
        target:addStatusEffect(EFFECT_TERROR,1,0,duration);
        return SUBEFFECT_NONE,0,EFFECT_TERROR;
    end
end;

function onMobDespawn(mob)
    GetNPCByID(BRIGANDISH_BLADE_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;
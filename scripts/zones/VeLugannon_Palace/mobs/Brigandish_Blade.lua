-----------------------------------
-- Area: VeLugannon Palace
--  NM:  Brigandish Blade
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_ADD_EFFECT,mob:getShortID());
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------
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

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    GetNPCByID(17502582):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;
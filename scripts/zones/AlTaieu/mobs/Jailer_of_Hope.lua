-----------------------------------
-- Area: Al'Taieu
--  NM:  Jailer of Hope
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");
-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_ADD_EFFECT,mob:getShortID());
    mob:setMobMod(MOBMOD_MAIN_2HOUR, 1);
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDisEngage Action
-----------------------------------

function onMobDisEngage(mob, target)
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob, target)
    local BattleTime = mob:getBattleTime();
    local JoH_2hr_Used = mob:getLocalVar("JoH_2hr");

    if (mob:getHPP() <= 10) then
        if (JoH_2hr_Used == 3) then
            mob:useMobAbility(432);
            mob:setLocalVar("JoH_2hr", 4);
        end
    elseif (mob:getHPP() <= 25) then
        if (JoH_2hr_Used == 2) then
            mob:useMobAbility(432);
            mob:setLocalVar("JoH_2hr", 3);
        end
    elseif (mob:getHPP() <= 50) then
        if (JoH_2hr_Used == 1) then
            mob:useMobAbility(432);
            mob:setLocalVar("JoH_2hr", 2);
        end
    elseif (mob:getHPP() <= 75) then
        if (JoH_2hr_Used == 0) then
            mob:useMobAbility(432);
            mob:setLocalVar("JoH_2hr", 1);
        end
    end

end;

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(mob,target,damage)
    if (math.random(1,15) ~= 5 or (target:hasStatusEffect(EFFECT_STUN) == true)) then
        return 0,0,0;
    else
        local duration = 5;
        target:addStatusEffect(EFFECT_STUN,1,0,duration);
        return SUBEFFECT_NONE,0,EFFECT_STUN;
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
end;
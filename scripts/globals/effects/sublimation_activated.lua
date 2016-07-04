-----------------------------------
--
--
--
-----------------------------------
require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
    local complete = false;
    local level = 0;
    if (target:getMainJob() == JOBS.SCH) then
        level = target:getMainLvl();
    else
        level = target:getSubLvl();
    end
    local basemp = math.floor((level - 15)/10);
    local bonus = target:getMod(MOD_SUBLIMATION_BONUS);
    
    local dmg = 2 + bonus;
    
    local store = effect:getPower() + basemp + bonus;
    
    local limit = math.floor((target:getBaseHP() + target:getMod(MOD_HP) + target:getMerit(MERIT_MAX_HP)) / 4) +
        target:getMerit(MERIT_MAX_SUBLIMATION);
    
    if not (target:getHPP() < 51 ) then
        if (target:hasStatusEffect(EFFECT_STONESKIN)) then
            local skin = target:getMod(MOD_STONESKIN);
            if (skin >= dmg) then --absorb all damage
                target:delMod(MOD_STONESKIN,dmg);
            else
                target:delStatusEffect(EFFECT_STONESKIN);
                target:delHP(dmg - skin);
                target:wakeUp();
                if (target:getHPP() < 51 ) then
                    complete = true;
                end
            end
        else
            target:delHP(dmg);
            target:wakeUp();
            if (target:getHPP() < 51 ) then
                complete = true;
            end
        end
    else
        complete = true;
    end
    
    if store > limit then
        store = limit;
        complete = true;
    end
    
    if (complete) then
        target:delStatusEffectSilent(EFFECT_SUBLIMATION_ACTIVATED);
        target:addStatusEffect(EFFECT_SUBLIMATION_COMPLETE,store,0,7200);
    else
        effect:setPower(store);
    end
    
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
end;
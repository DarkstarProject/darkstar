-----------------------------------------
-- ID: 5320
-- Item: Chunk of Smelling Salts
-- Item Effect: Recover Pets from Sleep
-- Duration: 180 Secs Medicated
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    result = 0;
    pet = target:getPet();
    if (pet:hasStatusEffect(EFFECT_MEDICINE)) then
        result = 111;
    end
    return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    if (target:addStatusEffect(EFFECT_MEDICINE,0,0,180,5320)) then
        target:messageBasic(205);
        pet:delStatusEffect(EFFECT_SLEEP_I);
        pet:delStatusEffect(EFFECT_SLEEP_II);
        pet:delStatusEffect(EFFECT_LULLABY);
    else
            target:messageBasic(423); -- no effect
        end
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
end;
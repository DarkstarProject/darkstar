-----------------------------------------
-- ID: 4374
-- Item: sleepshroom
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Strength -3
-- Mind 1
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,300,4374);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_STR, -3);
    target:addMod(MOD_MND, 1);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_STR, -3);
    target:delMod(MOD_MND, 1);
end;

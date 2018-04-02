-----------------------------------------
-- ID: 5773
-- Item: mushroom_crepe
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Mind 2
-- MP % 10 (cap 30)
-- Magic Accuracy +10
-- Magic Def. Bonus +5
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(dsp.effects.FOOD) == true or target:hasStatusEffect(dsp.effects.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effects.FOOD,0,0,1800,5773);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_MND, 2);
    target:addMod(MOD_FOOD_MPP, 10);
    target:addMod(MOD_FOOD_MP_CAP, 30);
    target:addMod(MOD_MACC, 10);
    target:addMod(MOD_MDEF, 5);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_MND, 2);
    target:delMod(MOD_FOOD_MPP, 10);
    target:delMod(MOD_FOOD_MP_CAP, 30);
    target:delMod(MOD_MACC, 10);
    target:delMod(MOD_MDEF, 5);
end;

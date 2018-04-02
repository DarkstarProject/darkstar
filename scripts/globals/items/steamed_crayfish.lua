-----------------------------------------
-- ID: 4338
-- Item: steamed_crayfish
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Defense % 30
-- Defense Cap 30
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,3600,4338);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_FOOD_DEFP, 30);
    target:addMod(MOD_FOOD_DEF_CAP, 30);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_FOOD_DEFP, 30);
    target:delMod(MOD_FOOD_DEF_CAP, 30);
end;

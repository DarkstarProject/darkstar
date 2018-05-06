-----------------------------------------
-- ID: 5555
-- Item: serving_of_flurry_courante
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Magic % 19
-- Magic Cap 65
-- Intelligence 2
-- Magic Regen While Healing 1
-- Wind Resist 5
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(dsp.effect.FOOD) == true or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5555);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.FOOD_MPP, 19);
    target:addMod(dsp.mod.FOOD_MP_CAP, 65);
    target:addMod(dsp.mod.INT, 2);
    target:addMod(dsp.mod.MPHEAL, 1);
    target:addMod(dsp.mod.WINDRES, 5);
end;

function onEffectLose(target, effect)
    target:delMod(dsp.mod.FOOD_MPP, 19);
    target:delMod(dsp.mod.FOOD_MP_CAP, 65);
    target:delMod(dsp.mod.INT, 2);
    target:delMod(dsp.mod.MPHEAL, 1);
    target:delMod(dsp.mod.WINDRES, 5);
end;

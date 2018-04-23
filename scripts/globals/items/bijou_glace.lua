-----------------------------------------
-- ID: 4269
-- Item: Bijou Glace
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Magic % 13
-- Magic Cap 90
-- Magic Regen While Healing 1
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,14400,4269);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_MPP, 13);
    target:addMod(MOD_FOOD_MP_CAP, 90);
    target:addMod(MOD_MPHEAL, 1);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_FOOD_MPP, 13);
    target:delMod(MOD_FOOD_MP_CAP, 90);
    target:delMod(MOD_MPHEAL, 1);
end;

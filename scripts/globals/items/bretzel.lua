-----------------------------------------
-- ID: 4391
-- Item: Bretzel
-- Food Effect: 3Min, All Races
-----------------------------------------
-- Magic % 8
-- Magic Cap 55
-- Vitality 2
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,180,4391);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_MPP, 8);
    target:addMod(MOD_FOOD_MP_CAP, 55);
    target:addMod(MOD_VIT, 2);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_FOOD_MPP, 8);
    target:delMod(MOD_FOOD_MP_CAP, 55);
    target:delMod(MOD_VIT, 2);
end;

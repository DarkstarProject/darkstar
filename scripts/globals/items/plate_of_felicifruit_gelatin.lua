-----------------------------------------
-- ID: 5978
-- Item: Plate of Felicifruit Gelatin
-- Food Effect: 180 Min, All Races
-----------------------------------------
-- MP % 5 Cap 100
-- Intelligence +7
-- MP Healing +3
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,10800,5978);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_FOOD_MPP, 5);
    target:addMod(MOD_FOOD_MP_CAP, 100);
    target:addMod(MOD_INT, 7);
    target:addMod(MOD_MPHEAL, 3);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_FOOD_MPP, 5);
    target:delMod(MOD_FOOD_MP_CAP, 100);
    target:delMod(MOD_INT, 7);
    target:delMod(MOD_MPHEAL, 3);
end;

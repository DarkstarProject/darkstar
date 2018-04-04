-----------------------------------------
-- ID: 5643
-- Item: serving_of_cibarious_cilbir
-- Food Effect: 4Hrs, All Races
-----------------------------------------
-- HP % 6 (cap 150)
-- MP % 6 (cap 100)
-- HP recovered while healing 3
-- MP recovered while healing 4
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,14400,5643);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_FOOD_HPP, 6);
    target:addMod(MOD_FOOD_HP_CAP, 150);
    target:addMod(MOD_FOOD_MPP, 6);
    target:addMod(MOD_FOOD_MP_CAP, 100);
    target:addMod(MOD_MPHEAL, 4);
    target:addMod(MOD_HPHEAL, 3);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_FOOD_HPP, 6);
    target:delMod(MOD_FOOD_HP_CAP, 150);
    target:delMod(MOD_FOOD_MPP, 6);
    target:delMod(MOD_FOOD_MP_CAP, 100);
    target:delMod(MOD_MPHEAL, 4);
    target:delMod(MOD_HPHEAL, 3);
end;

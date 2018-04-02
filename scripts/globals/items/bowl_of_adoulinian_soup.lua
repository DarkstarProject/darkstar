-----------------------------------------
-- ID: 5998
-- Item: Bowl of Adoulin Soup
-- Food Effect: 180 Min, All Races
-----------------------------------------
-- HP % 3 Cap 40
-- Vitality 3
-- Defense % 15 Cap 70
-- HP Healing 6
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,10800,5998);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_HPP, 3);
    target:addMod(MOD_FOOD_HP_CAP, 40);
    target:addMod(MOD_VIT, 3);
    target:addMod(MOD_FOOD_DEFP, 15);
    target:addMod(MOD_FOOD_DEF_CAP, 70);
    target:addMod(MOD_HPHEAL, 6);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_FOOD_HPP, 3);
    target:delMod(MOD_FOOD_HP_CAP, 40);
    target:delMod(MOD_VIT, 3);
    target:delMod(MOD_FOOD_DEFP, 15);
    target:delMod(MOD_FOOD_DEF_CAP, 70);
    target:delMod(MOD_HPHEAL, 6);
end;

-----------------------------------------
-- ID: 5999
-- Item: Bowl of Adoulin Soup +1
-- Food Effect: 240 Min, All Races
-----------------------------------------
-- HP % 4 Cap 45
-- Vitality 4
-- Defense % 16 Cap 75
-- HP Healing 7
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,5999);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_HPP, 4);
    target:addMod(MOD_FOOD_HP_CAP, 45);
    target:addMod(MOD_VIT, 4);
    target:addMod(MOD_FOOD_DEFP, 16);
    target:addMod(MOD_FOOD_DEF_CAP, 75);
    target:addMod(MOD_HPHEAL, 7);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_HPP, 4);
    target:delMod(MOD_FOOD_HP_CAP, 45);
    target:delMod(MOD_VIT, 4);
    target:delMod(MOD_FOOD_DEFP, 16);
    target:delMod(MOD_FOOD_DEF_CAP, 75);
    target:delMod(MOD_HPHEAL, 7);
end;

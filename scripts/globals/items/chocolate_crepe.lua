-----------------------------------------
-- ID: 5775
-- Item: Chocolate Crepe
-- Food Effect: 30 Min, All Races
-----------------------------------------
-- HP +5% (cap 15)
-- MP Healing 2
-- Magic Accuracy +20% (cap 35)
-- Magic Defense +1
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,5775);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_HPP, 5);
    target:addMod(MOD_FOOD_HP_CAP, 15);
    target:addMod(MOD_MPHEAL, 2);
    target:addMod(MOD_MDEF, 1);
    target:addMod(MOD_FOOD_MACCP, 20);
    target:addMod(MOD_FOOD_MACC_CAP, 35);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_HPP, 5);
    target:delMod(MOD_FOOD_HP_CAP, 15);
    target:delMod(MOD_MPHEAL, 2);
    target:delMod(MOD_MDEF, 1);
    target:delMod(MOD_FOOD_MACCP, 20);
    target:delMod(MOD_FOOD_MACC_CAP, 35);
end;

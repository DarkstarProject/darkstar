-----------------------------------------
-- ID: 5776
-- Item: Crepe Caprice
-- Food Effect: 30 Min, All Races
-----------------------------------------
-- HP +5% (cap20)
-- MP Healing 3
-- Magic Accuracy +21% (cap 40)
-- Magic Defense +2
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,5776);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_HPP, 5);
    target:addMod(MOD_FOOD_HP_CAP, 20);
    target:addMod(MOD_MPHEAL, 3);
    target:addMod(MOD_MDEF, 2);
    target:addMod(MOD_FOOD_MACCP, 21);
    target:addMod(MOD_FOOD_MACC_CAP, 40);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_HPP, 5);
    target:delMod(MOD_FOOD_HP_CAP, 20);
    target:delMod(MOD_MPHEAL, 3);
    target:delMod(MOD_MDEF, 2);
    target:delMod(MOD_FOOD_MACCP, 21);
    target:delMod(MOD_FOOD_MACC_CAP, 40);
end;

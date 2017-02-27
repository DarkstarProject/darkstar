-----------------------------------------
-- ID: 5766
-- Item: Butter Crepe
-- Food Effect: 30 Min, All Races
-----------------------------------------
-- HP +10% (cap 10)
-- Magic Accuracy +20% (cap 25)
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,5766);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_HPP, 10);
    target:addMod(MOD_FOOD_HP_CAP, 10);
    target:addMod(MOD_MDEF, 1);
    target:addMod(MOD_FOOD_MACCP, 20);
    target:addMod(MOD_FOOD_MACC_CAP, 25);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_HPP, 10);
    target:delMod(MOD_FOOD_HP_CAP, 10);
    target:delMod(MOD_MDEF, 1);
    target:delMod(MOD_FOOD_MACCP, 20);
    target:delMod(MOD_FOOD_MACC_CAP, 25);
end;

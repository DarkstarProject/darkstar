-----------------------------------------
-- ID: 5772
-- Item: crepe_paysanne
-- Food Effect: 30 Min, All Races
-----------------------------------------
-- HP +10% (cap 30)
-- STR +2
-- VIT +1
-- Magic Accuracy +15
-- Magic Defense +4
-- hHP +3
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,5772);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_HPP, 10);
    target:addMod(MOD_FOOD_HP_CAP, 30);
    target:addMod(MOD_STR, 2);
    target:addMod(MOD_VIT, 1);
    target:addMod(MOD_MACC, 15);
    target:addMod(MOD_MDEF, 4);
    target:addMod(MOD_HPHEAL, 3);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_HPP, 10);
    target:delMod(MOD_FOOD_HP_CAP, 30);
    target:delMod(MOD_STR, 2);
    target:delMod(MOD_VIT, 1);
    target:delMod(MOD_MACC, 15);
    target:delMod(MOD_MDEF, 4);
    target:delMod(MOD_HPHEAL, 3);
end;

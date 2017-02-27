-----------------------------------------
-- ID: 5172
-- Item: windurst_taco
-- Food Effect: 30Min, All Races
-----------------------------------------
-- MP 20
-- Vitality -1
-- Agility 5
-- MP Recovered While Healing 1
-- Ranged Accuracy % 8 (cap 10)
-- Ranged Attack +1
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,5172);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_MP, 20);
    target:addMod(MOD_VIT, -1);
    target:addMod(MOD_AGI, 5);
    target:addMod(MOD_MPHEAL, 1);
    target:addMod(MOD_RATT, 1);
    target:addMod(MOD_FOOD_RACCP, 8);
    target:addMod(MOD_FOOD_RACC_CAP, 10);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_MP, 20);
    target:delMod(MOD_VIT, -1);
    target:delMod(MOD_AGI, 5);
    target:delMod(MOD_MPHEAL, 1);
    target:delMod(MOD_RATT, 1);
    target:delMod(MOD_FOOD_RACCP, 8);
    target:delMod(MOD_FOOD_RACC_CAP, 10);
end;

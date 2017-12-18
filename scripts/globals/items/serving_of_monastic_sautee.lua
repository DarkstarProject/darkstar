-----------------------------------------
-- ID: 4293
-- Item: serving_of_monastic_sautee
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Agility 1
-- Ranged ACC % 7
-- Ranged ACC Cap 20
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,4293);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_AGI, 1);
    target:addMod(MOD_FOOD_RACCP, 7);
    target:addMod(MOD_FOOD_RACC_CAP, 20);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_AGI, 1);
    target:delMod(MOD_FOOD_RACCP, 7);
    target:delMod(MOD_FOOD_RACC_CAP, 20);
end;

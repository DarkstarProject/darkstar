-----------------------------------------
-- ID: 4601
-- Item: Bowl of Sopa de Pez Blanco
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Health 12
-- Dexterity 6
-- Mind -4
-- Accuracy 3
-- Ranged ACC % 7
-- Ranged ACC Cap 10
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,10800,4601);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_HP, 12);
    target:addMod(MOD_DEX, 6);
    target:addMod(MOD_MND, -4);
    target:addMod(MOD_ACC, 3);
    target:addMod(MOD_FOOD_RACCP, 7);
    target:addMod(MOD_FOOD_RACC_CAP, 10);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 12);
    target:delMod(MOD_DEX, 6);
    target:delMod(MOD_MND, -4);
    target:delMod(MOD_ACC, 3);
    target:delMod(MOD_FOOD_RACCP, 7);
    target:delMod(MOD_FOOD_RACC_CAP, 10);
end;

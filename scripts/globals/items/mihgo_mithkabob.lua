-----------------------------------------
-- ID: 5708
-- Item: Mihgo Mithkabob
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- Dexterity 5
-- Vitality 2
-- Mind -2
-- Accuracy +50
-- Ranged Accuracy +50
-- Evasion +5
-- Defense % 25 (cap 95)
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,14400,5708);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_DEX, 5);
    target:addMod(MOD_VIT, 2);
    target:addMod(MOD_MND, -2);
    target:addMod(MOD_ACC, 50);
    target:addMod(MOD_RACC, 50);
    target:addMod(MOD_EVA, 5);
    target:addMod(MOD_FOOD_DEFP, 25);
    target:addMod(MOD_FOOD_DEF_CAP, 95);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_DEX, 5);
    target:delMod(MOD_VIT, 2);
    target:delMod(MOD_MND, -2);
    target:delMod(MOD_ACC, 50);
    target:delMod(MOD_RACC, 50);
    target:delMod(MOD_EVA, 5);
    target:delMod(MOD_FOOD_DEFP, 25);
    target:delMod(MOD_FOOD_DEF_CAP, 95);
end;

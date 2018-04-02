-----------------------------------------
-- ID: 5170
-- Item: green_quiche
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Magic 10
-- Agility 1
-- Vitality -1
-- Ranged ACC % 7
-- Ranged ACC Cap 15
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,1800,5170);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_MP, 10);
    target:addMod(MOD_AGI, 1);
    target:addMod(MOD_VIT, -1);
    target:addMod(MOD_FOOD_RACCP, 7);
    target:addMod(MOD_FOOD_RACC_CAP, 15);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_MP, 10);
    target:delMod(MOD_AGI, 1);
    target:delMod(MOD_VIT, -1);
    target:delMod(MOD_FOOD_RACCP, 7);
    target:delMod(MOD_FOOD_RACC_CAP, 15);
end;

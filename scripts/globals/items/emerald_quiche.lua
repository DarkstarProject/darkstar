-----------------------------------------
-- ID: 5171
-- Item: emerald_quiche
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Magic 15
-- Agility 1
-- Ranged ACC % 7
-- Ranged ACC Cap 20
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,3600,5171);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_MP, 15);
    target:addMod(MOD_AGI, 1);
    target:addMod(MOD_FOOD_RACCP, 7);
    target:addMod(MOD_FOOD_RACC_CAP, 20);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_MP, 15);
    target:delMod(MOD_AGI, 1);
    target:delMod(MOD_FOOD_RACCP, 7);
    target:delMod(MOD_FOOD_RACC_CAP, 20);
end;

-----------------------------------------
-- ID: 4321
-- Item: timbre_timbers_salad
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Magic 20
-- Agility 5
-- Vitality -1
-- Ranged ACC % 8
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,14400,4321);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_MP, 20);
    target:addMod(MOD_AGI, 5);
    target:addMod(MOD_VIT, -1);
    target:addMod(MOD_FOOD_RACCP, 8);
    target:addMod(MOD_FOOD_RACC_CAP, 15);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_MP, 20);
    target:delMod(MOD_AGI, 5);
    target:delMod(MOD_VIT, -1);
    target:delMod(MOD_FOOD_RACCP, 8);
    target:delMod(MOD_FOOD_RACC_CAP, 15);
end;

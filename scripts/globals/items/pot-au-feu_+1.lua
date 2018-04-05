-----------------------------------------
-- ID: 5753
-- Item: Pot-au-feu
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Strength 4
-- Agility 4
-- Intelligence -3
-- Ranged Attk % 16 Cap 65
-- Ranged ACC % 11 Cap 55
-- Enmity -3
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,1800,5753);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_STR, 4);
    target:addMod(MOD_AGI, 4);
    target:addMod(MOD_INT, -3);
    target:addMod(MOD_FOOD_RATTP, 16);
    target:addMod(MOD_FOOD_RATT_CAP, 65);
    target:addMod(MOD_FOOD_RACCP, 11);
    target:addMod(MOD_FOOD_RACC_CAP, 55);
    target:addMod(MOD_ENMITY, -3);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_STR, 4);
    target:delMod(MOD_AGI, 4);
    target:delMod(MOD_INT, -3);
    target:delMod(MOD_FOOD_RATTP, 16);
    target:delMod(MOD_FOOD_RATT_CAP, 65);
    target:delMod(MOD_FOOD_RACCP, 11);
    target:delMod(MOD_FOOD_RACC_CAP, 55);
    target:delMod(MOD_ENMITY, -3);
end;

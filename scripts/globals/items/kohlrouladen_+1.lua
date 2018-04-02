-----------------------------------------
-- ID: 5761
-- Item: kohlrouladen
-- Food Effect: 4hr, All Races
-----------------------------------------
-- Strength 4
-- Agility 4
-- Intelligence -4
-- RACC +10% (cap 65)
-- RATT +16% (cap 70)
-- Enmity -5
-- Subtle Blow +6
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,14400,5761);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_STR, 4);
    target:addMod(MOD_AGI, 4);
    target:addMod(MOD_INT, -4);
    target:addMod(MOD_FOOD_RACCP, 10);
    target:addMod(MOD_FOOD_RACC_CAP, 65);
    target:addMod(MOD_FOOD_RATTP, 16);
    target:addMod(MOD_FOOD_RATT_CAP, 70);
    target:addMod(MOD_ENMITY, -5);
    target:addMod(MOD_SUBTLE_BLOW, 6);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_STR, 4);
    target:delMod(MOD_AGI, 4);
    target:delMod(MOD_INT, -4);
    target:delMod(MOD_FOOD_RACCP, 10);
    target:delMod(MOD_FOOD_RACC_CAP, 65);
    target:delMod(MOD_FOOD_RATTP, 16);
    target:delMod(MOD_FOOD_RATT_CAP, 70);
    target:delMod(MOD_ENMITY, -5);
    target:delMod(MOD_SUBTLE_BLOW, 6);
end;

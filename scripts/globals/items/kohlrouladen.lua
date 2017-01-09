-----------------------------------------
-- ID: 5760
-- Item: kohlrouladen
-- Food Effect: 3hr, All Races
-----------------------------------------
-- Strength 3
-- Agility 3
-- Intelligence -5
-- RACC +8% (cap 60)
-- RATT +14% (cap 65)
-- Enmity -4
-- Subtle Blow +5
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,5760);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_STR, 3);
    target:addMod(MOD_AGI, 3);
    target:addMod(MOD_INT, -5);
    target:addMod(MOD_FOOD_RACCP, 8);
    target:addMod(MOD_FOOD_RACC_CAP, 60);
    target:addMod(MOD_FOOD_RATTP, 14);
    target:addMod(MOD_FOOD_RATT_CAP, 65);
    target:addMod(MOD_ENMITY, -4);
    target:addMod(MOD_SUBTLE_BLOW, 5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_STR, 3);
    target:delMod(MOD_AGI, 3);
    target:delMod(MOD_INT, -5);
    target:delMod(MOD_FOOD_RACCP, 8);
    target:delMod(MOD_FOOD_RACC_CAP, 60);
    target:delMod(MOD_FOOD_RATTP, 14);
    target:delMod(MOD_FOOD_RATT_CAP, 65);
    target:delMod(MOD_ENMITY, -4);
    target:delMod(MOD_SUBTLE_BLOW, 5);
end;

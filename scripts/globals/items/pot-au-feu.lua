-----------------------------------------
-- ID: 5752
-- Item: Pot-au-feu
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Strength 3
-- Agility 3
-- Intelligence -3
-- Ranged Attk % 15 Cap 60
-- Ranged ACC % 10 Cap 50
-- Enmity -3
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,5752);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_STR, 3);
    target:addMod(MOD_AGI, 3);
    target:addMod(MOD_INT, -3);
    target:addMod(MOD_FOOD_RATTP, 15);
    target:addMod(MOD_FOOD_RATT_CAP, 60);
    target:addMod(MOD_FOOD_RACCP, 10);
    target:addMod(MOD_FOOD_RACC_CAP, 50);
    target:addMod(MOD_ENMITY, -3);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_STR, 3);
    target:delMod(MOD_AGI, 3);
    target:delMod(MOD_INT, -3);
    target:delMod(MOD_FOOD_RATTP, 15);
    target:delMod(MOD_FOOD_RATT_CAP, 60);
    target:delMod(MOD_FOOD_RACCP, 10);
    target:delMod(MOD_FOOD_RACC_CAP, 50);
    target:delMod(MOD_ENMITY, -3);
end;

-----------------------------------------
-- ID: 4439
-- Item: Bowl of Navarin
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Health % 3 (cap 130)
-- Strength 3
-- Agility 1
-- Vitality 1
-- Intelligence -1
-- Attack % 27
-- Attack Cap 30
-- Evasion 5
-- Ranged ATT % 27
-- Ranged ATT Cap 30
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,4439);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_HPP, 3);
    target:addMod(MOD_FOOD_HP_CAP, 130);
    target:addMod(MOD_STR, 3);
    target:addMod(MOD_AGI, 1);
    target:addMod(MOD_VIT, 1);
    target:addMod(MOD_INT, -1);
    target:addMod(MOD_FOOD_ATTP, 27);
    target:addMod(MOD_FOOD_ATT_CAP, 30);
    target:addMod(MOD_EVA, 5);
    target:addMod(MOD_FOOD_RATTP, 27);
    target:addMod(MOD_FOOD_RATT_CAP, 30);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_HPP, 3);
    target:delMod(MOD_FOOD_HP_CAP, 130);
    target:delMod(MOD_STR, 3);
    target:delMod(MOD_AGI, 1);
    target:delMod(MOD_VIT, 1);
    target:delMod(MOD_INT, -1);
    target:delMod(MOD_FOOD_ATTP, 27);
    target:delMod(MOD_FOOD_ATT_CAP, 30);
    target:delMod(MOD_EVA, 5);
    target:delMod(MOD_FOOD_RATTP, 27);
    target:delMod(MOD_FOOD_RATT_CAP, 30);
end;

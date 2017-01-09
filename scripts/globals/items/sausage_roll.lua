-----------------------------------------
-- ID: 4396
-- Item: sausage_roll
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health % 6 (cap 160)
-- Vitality 3
-- Intelligence -1
-- Attack % 27
-- Attack Cap 30
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,4396);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_HPP, 6);
    target:addMod(MOD_FOOD_HP_CAP, 160);
    target:addMod(MOD_VIT, 3);
    target:addMod(MOD_INT, -1);
    target:addMod(MOD_FOOD_ATTP, 27);
    target:addMod(MOD_FOOD_ATT_CAP, 30);
    target:addMod(MOD_FOOD_RATTP, 27);
    target:addMod(MOD_FOOD_RATT_CAP, 30);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_HPP, 6);
    target:delMod(MOD_FOOD_HP_CAP, 160);
    target:delMod(MOD_VIT, 3);
    target:delMod(MOD_INT, -1);
    target:delMod(MOD_FOOD_ATTP, 27);
    target:delMod(MOD_FOOD_ATT_CAP, 30);
    target:delMod(MOD_FOOD_RATTP, 27);
    target:delMod(MOD_FOOD_RATT_CAP, 30);
end;

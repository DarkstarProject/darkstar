-----------------------------------------
-- ID: 4506
-- Item: mutton_tortilla
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Magic 10
-- Strength 3
-- Vitality 1
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,4506);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_MP, 10);
    target:addMod(MOD_STR, 3);
    target:addMod(MOD_VIT, 1);
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
    target:delMod(MOD_MP, 10);
    target:delMod(MOD_STR, 3);
    target:delMod(MOD_VIT, 1);
    target:delMod(MOD_INT, -1);
    target:delMod(MOD_FOOD_ATTP, 27);
    target:delMod(MOD_FOOD_ATT_CAP, 30);
    target:delMod(MOD_FOOD_RATTP, 27);
    target:delMod(MOD_FOOD_RATT_CAP, 30);
end;

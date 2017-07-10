-----------------------------------------
-- ID: 5199
-- Item: dish_of_spaghetti_carbonara_+1
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health % 14
-- Health Cap 180
-- Magic 15
-- Strength 4
-- Vitality 2
-- Intelligence -3
-- Attack % 17
-- Attack Cap 70
-- Store TP 6
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
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,5199);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_HPP, 14);
    target:addMod(MOD_FOOD_HP_CAP, 180);
    target:addMod(MOD_MP, 15);
    target:addMod(MOD_STR, 4);
    target:addMod(MOD_VIT, 2);
    target:addMod(MOD_INT, -3);
    target:addMod(MOD_FOOD_ATTP, 17);
    target:addMod(MOD_FOOD_ATT_CAP, 70);
    target:addMod(MOD_STORETP, 6);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_HPP, 14);
    target:delMod(MOD_FOOD_HP_CAP, 180);
    target:delMod(MOD_MP, 15);
    target:delMod(MOD_STR, 4);
    target:delMod(MOD_VIT, 2);
    target:delMod(MOD_INT, -3);
    target:delMod(MOD_FOOD_ATTP, 17);
    target:delMod(MOD_FOOD_ATT_CAP, 70);
    target:delMod(MOD_STORETP, 6);
end;

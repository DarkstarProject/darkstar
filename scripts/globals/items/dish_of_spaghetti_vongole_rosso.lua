-----------------------------------------
-- ID: 5189
-- Item: dish_of_spaghetti_vongole_rosso
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health % 20
-- Health Cap 90
-- Vitality 2
-- Mind -1
-- Defense % 25
-- Defense Cap 30
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,5189);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_HPP, 20);
    target:addMod(MOD_FOOD_HP_CAP, 90);
    target:addMod(MOD_VIT, 2);
    target:addMod(MOD_MND, -1);
    target:addMod(MOD_FOOD_DEFP, 25);
    target:addMod(MOD_FOOD_DEF_CAP, 30);
    target:addMod(MOD_STORETP, 6);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_HPP, 20);
    target:delMod(MOD_FOOD_HP_CAP, 90);
    target:delMod(MOD_VIT, 2);
    target:delMod(MOD_MND, -1);
    target:delMod(MOD_FOOD_DEFP, 25);
    target:delMod(MOD_FOOD_DEF_CAP, 30);
    target:delMod(MOD_STORETP, 6);
end;

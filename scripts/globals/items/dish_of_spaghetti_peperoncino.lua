-----------------------------------------
-- ID: 5188
-- Item: dish_of_spaghetti_peperoncino
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health % 30
-- Health Cap 70
-- Vitality 2
-- Store TP +6
-- Resist virus +5
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,5188);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_HPP, 30);
    target:addMod(MOD_FOOD_HP_CAP, 70);
    target:addMod(MOD_VIT, 2);
    target:addMod(MOD_STORETP, 6);
    target:addMod(MOD_VIRUSRES, 10);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_HPP, 30);
    target:delMod(MOD_FOOD_HP_CAP, 70);
    target:delMod(MOD_VIT, 2);
    target:delMod(MOD_STORETP, 6);
    target:delMod(MOD_VIRUSRES, 10);
end;

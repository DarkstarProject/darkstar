-----------------------------------------
-- ID: 5213
-- Item: dish_of_spaghetti_melanzane
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health % 25
-- Health Cap 100
-- Vitality 2
-- Store TP 6
-- Resist sleep 10
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT.FOOD) == true or target:hasStatusEffect(EFFECT.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(EFFECT.FOOD,0,0,1800,5213);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_FOOD_HPP, 25);
    target:addMod(MOD_FOOD_HP_CAP, 100);
    target:addMod(MOD_VIT, 2);
    target:addMod(MOD_STORETP, 6);
    target:addMod(MOD_SLEEPRES, 10);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_FOOD_HPP, 25);
    target:delMod(MOD_FOOD_HP_CAP, 100);
    target:delMod(MOD_VIT, 2);
    target:delMod(MOD_STORETP, 6);
    target:delMod(MOD_SLEEPRES, 10);
end;

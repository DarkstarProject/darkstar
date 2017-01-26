-----------------------------------------
-- ID: 5211
-- Item: dish_of_spaghetti_arrabbiata
-- Food Effect: 30Min, All Races
-----------------------------------------
-- HP +17% (cap 140)
-- Strength +5
-- Vitality +2
-- Intelligence -7
-- Attack +22% (cap 90)
-- Ranged Attack +22% (cap 90)
-- Store TP +6
-- Sleep resistance +8
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,5211);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_HPP, 17);
    target:addMod(MOD_FOOD_HP_CAP, 140);
    target:addMod(MOD_STR, 5);
    target:addMod(MOD_VIT, 2);
    target:addMod(MOD_INT, -7);
    target:addMod(MOD_FOOD_ATTP, 22);
    target:addMod(MOD_FOOD_ATT_CAP, 90);
    target:addMod(MOD_FOOD_RATTP, 22);
    target:addMod(MOD_FOOD_RATT_CAP, 90);
    target:addMod(MOD_STORETP, 6);
    target:addMod(MOD_SLEEPRES, 8);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_HPP, 17);
    target:delMod(MOD_FOOD_HP_CAP, 140);
    target:delMod(MOD_STR, 5);
    target:delMod(MOD_VIT, 2);
    target:delMod(MOD_INT, -7);
    target:delMod(MOD_FOOD_ATTP, 22);
    target:delMod(MOD_FOOD_ATT_CAP, 90);
    target:delMod(MOD_FOOD_RATTP, 22);
    target:delMod(MOD_FOOD_RATT_CAP, 90);
    target:delMod(MOD_STORETP, 6);
    target:delMod(MOD_SLEEPRES, 8);
end;

-----------------------------------------
-- ID: 6458
-- Item: bowl_of_soy_ramen
-- Food Effect: 30Min, All Races
-----------------------------------------
-- HP +50
-- STR +5
-- VIT +5
-- AGI +3
-- Attack +10% (cap 170)
-- Ranged Attack +10% (cap 170)
-- Resist Slow +10
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,6458);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 50);
    target:addMod(MOD_STR, 5);
    target:addMod(MOD_VIT, 5);
    target:addMod(MOD_AGI, 3);
    target:addMod(MOD_FOOD_ATTP, 10);
    target:addMod(MOD_FOOD_ATT_CAP, 170);
    target:addMod(MOD_FOOD_RATTP, 10);
    target:addMod(MOD_FOOD_RATT_CAP, 170);
    target:addMod(MOD_SLOWRES, 10);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 50);
    target:delMod(MOD_STR, 5);
    target:delMod(MOD_VIT, 5);
    target:delMod(MOD_AGI, 3);
    target:delMod(MOD_FOOD_ATTP, 10);
    target:delMod(MOD_FOOD_ATT_CAP, 170);
    target:delMod(MOD_FOOD_RATTP, 10);
    target:delMod(MOD_FOOD_RATT_CAP, 170);
    target:delMod(MOD_SLOWRES, 10);
end;

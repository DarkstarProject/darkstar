-----------------------------------------
-- ID: 5600
-- Item: Balik Sis
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Dexterity 4
-- Mind -2
-- Attack % 13
-- Attack Cap 40
-- Ranged ACC 1
-- Ranged ATT % 13
-- Ranged ATT Cap 40
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,5600);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_DEX, 4);
    target:addMod(MOD_MND, -2);
    target:addMod(MOD_FOOD_ATTP, 13);
    target:addMod(MOD_FOOD_ATT_CAP, 40);
    target:addMod(MOD_RACC, 1);
    target:addMod(MOD_FOOD_RATTP, 13);
    target:addMod(MOD_FOOD_RATT_CAP, 40);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_DEX, 4);
    target:delMod(MOD_MND, -2);
    target:delMod(MOD_FOOD_ATTP, 13);
    target:delMod(MOD_FOOD_ATT_CAP, 40);
    target:delMod(MOD_RACC, 1);
    target:delMod(MOD_FOOD_RATTP, 13);
    target:delMod(MOD_FOOD_RATT_CAP, 40);
end;

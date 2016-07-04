-----------------------------------------
-- ID: 4295
-- Item: plate_of_royal_sautee
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Strength 5
-- Agility 1
-- Intelligence -2
-- Attack % 20
-- Attack Cap 80
-- Ranged ATT % 20
-- Ranged ATT Cap 80
-- Stun Resist 5
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
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,4295);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_STR, 5);
    target:addMod(MOD_AGI, 1);
    target:addMod(MOD_INT, -2);
    target:addMod(MOD_FOOD_ATTP, 20);
    target:addMod(MOD_FOOD_ATT_CAP, 80);
    target:addMod(MOD_FOOD_RATTP, 20);
    target:addMod(MOD_FOOD_RATT_CAP, 80);
    target:addMod(MOD_STUNRES, 5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_STR, 5);
    target:delMod(MOD_AGI, 1);
    target:delMod(MOD_INT, -2);
    target:delMod(MOD_FOOD_ATTP, 20);
    target:delMod(MOD_FOOD_ATT_CAP, 80);
    target:delMod(MOD_FOOD_RATTP, 20);
    target:delMod(MOD_FOOD_RATT_CAP, 80);
    target:delMod(MOD_STUNRES, 5);
end;

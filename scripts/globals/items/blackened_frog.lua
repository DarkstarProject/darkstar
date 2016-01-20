-----------------------------------------
-- ID: 4536
-- Item: Blackened Frog
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Dexterity 2
-- Agility 2
-- Mind -2
-- Attack % 14
-- Attack Cap 60
-- Ranged ATT % 14
-- Ranged ATT Cap 60
-- Enmity -5
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
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,4536);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_DEX, 2);
    target:addMod(MOD_AGI, 2);
    target:addMod(MOD_MND, -2);
    target:addMod(MOD_FOOD_ATTP, 14);
    target:addMod(MOD_FOOD_ATT_CAP, 60);
    target:addMod(MOD_FOOD_RATTP, 14);
    target:addMod(MOD_FOOD_RATT_CAP, 60);
    target:addMod(MOD_ENMITY, -5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_DEX, 2);
    target:delMod(MOD_AGI, 2);
    target:delMod(MOD_MND, -2);
    target:delMod(MOD_FOOD_ATTP, 14);
    target:delMod(MOD_FOOD_ATT_CAP, 60);
    target:delMod(MOD_FOOD_RATTP, 14);
    target:delMod(MOD_FOOD_RATT_CAP, 60);
    target:delMod(MOD_ENMITY, -5);
end;

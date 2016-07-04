-----------------------------------------
-- ID: 5653
-- Item: Cherry Muffin
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Intelligence 1
-- Magic % 10
-- Magic Cap 80
-- Agility -1
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
local result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD)) then
        result = 246;
    end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,1800,5653);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_INT, 1);
    target:addMod(MOD_FOOD_MPP, 10);
    target:addMod(MOD_FOOD_MP_CAP, 80);
    target:addMod(MOD_AGI, -1);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_INT, 1);
    target:delMod(MOD_FOOD_MPP, 10);
    target:delMod(MOD_FOOD_MP_CAP, 80);
    target:delMod(MOD_AGI, -1);
end;

-----------------------------------------
-- ID: 5690
-- Item: Meatloaf +1
-- Food Effect: 3 Hrs, All Races
-----------------------------------------
-- Strength 6
-- Agility 2
-- Intelligence -3
-- Attack 18% Cap 95
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,5690);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_STR, 6);
    target:addMod(MOD_AGI, 2);
    target:addMod(MOD_INT, -3);
    target:addMod(MOD_FOOD_ATTP, 18);
    target:addMod(MOD_FOOD_ATT_CAP, 95);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_STR, 6);
    target:delMod(MOD_AGI, 2);
    target:delMod(MOD_INT, -3);
    target:delMod(MOD_FOOD_ATTP, 18);
    target:delMod(MOD_FOOD_ATT_CAP, 95);
end;

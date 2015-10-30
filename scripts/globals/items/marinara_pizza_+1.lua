-----------------------------------------
-- ID: 5744
-- Item: marinara_pizza +1
-- Food Effect: 4hours, All Races
-----------------------------------------
-- Health Points 25
-- Attack +21% (cap 55)
-- Accuracy +11% (cap 58)
-- Undead Killer
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
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,5744);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 25);
    target:addMod(MOD_FOOD_ATTP, 21);
    target:addMod(MOD_FOOD_ATT_CAP, 55);
    target:addMod(MOD_FOOD_ACCP, 11);
    target:addMod(MOD_FOOD_ACC_CAP, 58);
    target:addMod(MOD_UNDEAD_KILLER, 5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 25);
    target:delMod(MOD_FOOD_ATTP, 21);
    target:delMod(MOD_FOOD_ATT_CAP, 55);
    target:delMod(MOD_FOOD_ACCP, 11);
    target:delMod(MOD_FOOD_ACC_CAP, 58);
    target:delMod(MOD_UNDEAD_KILLER, 5);
end;

-----------------------------------------
-- ID: 6218
-- Item: slice of anchovy pizza +1
-- Food Effect: 60 min, All Races
-----------------------------------------
-- HP +35
-- DEX +2
-- Accuracy +9% (Cap 16)
-- Attack +10% (Cap 21)
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
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,6218);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 35);
    target:addMod(MOD_DEX, 2);
    target:addMod(MOD_FOOD_ACCP, 9);
    target:addMod(MOD_FOOD_ACC_CAP, 16);
    target:addMod(MOD_FOOD_ATTP, 10);
    target:addMod(MOD_FOOD_ATT_CAP, 21);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 35);
    target:delMod(MOD_DEX, 2);
    target:delMod(MOD_FOOD_ACCP, 9);
    target:delMod(MOD_FOOD_ACC_CAP, 16);
    target:delMod(MOD_FOOD_ATTP, 10);
    target:delMod(MOD_FOOD_ATT_CAP, 21);
end;

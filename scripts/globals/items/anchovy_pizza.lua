-----------------------------------------
-- ID: 5699
-- Item: anchovy_pizza
-- Food Effect: 3hours, All Races
-----------------------------------------
-- HP +30
-- DEX +1
-- Accuracy +9% (Cap 15)
-- Attack +10% (Cap 20)
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,5699);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 30);
    target:addMod(MOD_DEX, 1);
    target:addMod(MOD_FOOD_ACCP, 9);
    target:addMod(MOD_FOOD_ACC_CAP, 15);
    target:addMod(MOD_FOOD_ATTP, 10);
    target:addMod(MOD_FOOD_ATT_CAP, 20);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 30);
    target:delMod(MOD_DEX, 1);
    target:delMod(MOD_FOOD_ACCP, 9);
    target:delMod(MOD_FOOD_ACC_CAP, 15);
    target:delMod(MOD_FOOD_ATTP, 10);
    target:delMod(MOD_FOOD_ATT_CAP, 20);
end;

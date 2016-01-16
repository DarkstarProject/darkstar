-----------------------------------------
-- ID: 5698
-- Item: pepperoni_pizza_+1
-- Food Effect: 4hours, All Races
-----------------------------------------
-- Health Points 40
-- Strength 1
-- Accuracy 6% (caps @ 11)
-- Attack 11% (caps @ 27)

--**wiki has no data, so basing stats off of lq version
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
    target:addStatusEffect(EFFECT_FOOD,0,0,14400,5698);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 40);
    target:addMod(MOD_STR, 1);
    target:addMod(MOD_FOOD_ATTP, 11);
    target:addMod(MOD_FOOD_ATT_CAP, 27);
    target:addMod(MOD_FOOD_ACCP, 6);
    target:addMod(MOD_FOOD_ACC_CAP, 11);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 40);
    target:delMod(MOD_STR, 1);
    target:delMod(MOD_FOOD_ATTP, 11);
    target:delMod(MOD_FOOD_ATT_CAP, 27);
    target:delMod(MOD_FOOD_ACCP, 6);
    target:delMod(MOD_FOOD_ACC_CAP, 11);
end;

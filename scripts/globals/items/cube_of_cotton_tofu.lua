-----------------------------------------
-- ID: 5233
-- Item: cube_of_cotton_tofu
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Health % 10
-- Health Cap 30
-- Magic % 10
-- Magic Cap 30
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
    target:addStatusEffect(EFFECT_FOOD,0,0,300,5233);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_HPP, 10);
    target:addMod(MOD_FOOD_HP_CAP, 30);
    target:addMod(MOD_FOOD_MPP, 10);
    target:addMod(MOD_FOOD_MP_CAP, 30);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_HPP, 10);
    target:delMod(MOD_FOOD_HP_CAP, 30);
    target:delMod(MOD_FOOD_MPP, 10);
    target:delMod(MOD_FOOD_MP_CAP, 30);
end;

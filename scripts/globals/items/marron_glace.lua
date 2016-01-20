-----------------------------------------
-- ID: 4502
-- Item: Marron Glace
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Magic % 13
-- Magic Cap 85
-- Magic Regen While Healing 1
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,4502);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_MPP, 13);
    target:addMod(MOD_FOOD_MP_CAP, 85);
    target:addMod(MOD_MPHEAL, 1);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_MPP, 13);
    target:delMod(MOD_FOOD_MP_CAP, 85);
    target:delMod(MOD_MPHEAL, 1);
end;

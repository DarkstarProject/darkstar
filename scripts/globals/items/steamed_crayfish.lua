-----------------------------------------
-- ID: 4338
-- Item: steamed_crayfish
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Defense % 30
-- Defense Cap 30
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
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,4338);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_FOOD_DEFP, 30);
    target:addMod(MOD_FOOD_DEF_CAP, 30);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_FOOD_DEFP, 30);
    target:delMod(MOD_FOOD_DEF_CAP, 30);
end;

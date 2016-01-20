-----------------------------------------
-- ID: 4342
-- Item: steamed_crab
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Vitality 3
-- Defense % 27
-- Defense Cap 55
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
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,4342);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_VIT, 3);
    target:addMod(MOD_FOOD_DEFP, 27);
    target:addMod(MOD_FOOD_DEF_CAP, 55);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_VIT, 3);
    target:delMod(MOD_FOOD_DEFP, 27);
    target:delMod(MOD_FOOD_DEF_CAP, 55);
end;

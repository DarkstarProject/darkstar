-----------------------------------------
-- ID: 5756
-- Item: green_curry_bun
-- Food Effect: 1hour, All Races
-----------------------------------------
-- Vitality 1
-- Agility 2
-- Defense % 12
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
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,5756);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_VIT, 1);
    target:addMod(MOD_AGI, 2);
    target:addMod(MOD_FOOD_DEFP, 12);
    target:addMod(MOD_FOOD_DEF_CAP, 999);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_VIT, 1);
    target:delMod(MOD_AGI, 2);
    target:delMod(MOD_FOOD_DEFP, 12);
    target:delMod(MOD_FOOD_DEF_CAP, 999);
end;

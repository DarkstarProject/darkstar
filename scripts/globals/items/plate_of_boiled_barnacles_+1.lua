-----------------------------------------
-- ID: 5981
-- Item: Plate of Boiled Barnacles +1
-- Food Effect: 60 Mins, All Races
-----------------------------------------
-- Charisma -2
-- Defense % 26 Cap 135
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
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,5981);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_CHR, -2);
    target:addMod(MOD_FOOD_DEFP, 26);
    target:addMod(MOD_FOOD_DEF_CAP, 135);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_CHR, -2);
    target:delMod(MOD_FOOD_DEFP, 26);
    target:delMod(MOD_FOOD_DEF_CAP, 135);
end;

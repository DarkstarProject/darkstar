-----------------------------------------
-- ID: 4453
-- Item: Bowl of Eyeball Soup
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Charisma -10
-- Health Regen While Healing 4
-- Accuracy 12
-- Ranged ACC 12
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
    target:addStatusEffect(EFFECT_FOOD,0,0,10800,4453);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_CHR, -10);
    target:addMod(MOD_HPHEAL, 4);
    target:addMod(MOD_ACC, 12);
    target:addMod(MOD_RACC, 12);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_CHR, -10);
    target:delMod(MOD_HPHEAL, 4);
    target:delMod(MOD_ACC, 12);
    target:delMod(MOD_RACC, 12);
end;

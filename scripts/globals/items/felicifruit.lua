-----------------------------------------
-- ID: 5964
-- Item: Felicifruit
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Agility -7
-- Intelligence 5
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,300,5964);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_AGI, -7);
    target:addMod(MOD_INT, 5);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_AGI, -7);
    target:delMod(MOD_INT, 5);
end;

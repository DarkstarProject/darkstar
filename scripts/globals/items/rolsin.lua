-----------------------------------------
-- ID: 5673
-- Item: rolsin
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Agility -3
-- Intelligence 1
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,300,5673);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_AGI, -3);
    target:addMod(MOD_INT, 1);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_AGI, -3);
    target:delMod(MOD_INT, 1);
end;

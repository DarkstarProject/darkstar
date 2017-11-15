-----------------------------------------
-- ID: 5566
-- Item: Date
-- Food Effect: 5 Mins, All Races
-----------------------------------------
-- Intelligence 1
-- Agility -3
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
    target:addStatusEffect(EFFECT_FOOD,0,0,300,5566);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_INT, 1);
    target:addMod(MOD_AGI, -3);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_INT, 1);
    target:delMod(MOD_AGI, -3);
end;

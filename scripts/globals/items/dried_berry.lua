-----------------------------------------
-- ID: 5672
-- Item: dried_berry
-- Food Effect: 3Min, All Races
-----------------------------------------
-- Agility -3
-- Intelligence 1
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT.FOOD) == true or target:hasStatusEffect(EFFECT.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(EFFECT.FOOD,0,0,180,5672);
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

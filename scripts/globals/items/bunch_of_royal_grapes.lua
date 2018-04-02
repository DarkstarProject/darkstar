-----------------------------------------
-- ID: 5541
-- Item: Bunch of Royal Grapes
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Agility -6
-- Intelligence 4
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
    target:addStatusEffect(EFFECT.FOOD,0,0,300,5541);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_AGI, -6);
    target:addMod(MOD_INT, 4);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_AGI, -6);
    target:delMod(MOD_INT, 4);
end;

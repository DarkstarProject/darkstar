-----------------------------------------
-- ID: 4496
-- Item: piece_of_bubble_chocolate
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Magic Regen While Healing 1
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(dsp.effects.FOOD) == true or target:hasStatusEffect(dsp.effects.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effects.FOOD,0,0,1800,4496);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_MPHEAL, 1);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_MPHEAL, 1);
end;

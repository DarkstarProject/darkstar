-----------------------------------------
-- ID: 4283
-- Item: cup_of_choco-delight
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Magic Regen While Healing 5
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(dsp.effect.FOOD) == true or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,4283);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.MPHEAL, 5);
end;

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MPHEAL, 5);
end;

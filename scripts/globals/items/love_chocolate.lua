-----------------------------------------
-- ID: 5230
-- Item: love_chocolate
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Magic Regen While Healing 4
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,10800,5230);
end;

function onEffectGain(target, effect)
    target:addMod(dsp.mod.MPHEAL, 4);
end;

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MPHEAL, 4);
end;

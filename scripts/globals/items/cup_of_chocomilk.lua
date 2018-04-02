-----------------------------------------
-- ID: 4498
-- Item: cup_of_chocomilk
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Magic Regen While Healing 3
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,10800,4498);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_MPHEAL, 3);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_MPHEAL, 3);
end;

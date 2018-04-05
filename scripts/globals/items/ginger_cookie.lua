-----------------------------------------
-- ID: 4394
-- Item: ginger_cookie
-- Food Effect: 3Min, All Races
-----------------------------------------
-- Magic Regen While Healing 5
-- Plantoid Killer 10
-- Slow Resist 10
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,180,4394);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_MPHEAL, 5);
    target:addMod(MOD_PLANTOID_KILLER, 10);
    target:addMod(MOD_SLOWRES, 10);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_MPHEAL, 5);
    target:delMod(MOD_PLANTOID_KILLER, 10);
    target:delMod(MOD_SLOWRES, 10);
end;

-----------------------------------------
-- ID: 4576
-- Item: wizard_cookie
-- Food Effect: 5Min, All Races
-----------------------------------------
-- MP Recovered While Healing 7
-- Plantoid Killer 12
-- Slow Resist 12
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,300,4576);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_MPHEAL, 7);
    target:addMod(MOD_PLANTOID_KILLER, 12);
    target:addMod(MOD_SLOWRES, 12);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_MPHEAL, 7);
    target:delMod(MOD_PLANTOID_KILLER, 12);
    target:delMod(MOD_SLOWRES, 12);
end;

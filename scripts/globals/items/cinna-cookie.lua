-----------------------------------------
-- ID: 4397
-- Item: cinna-cookie
-- Food Effect: 3Min, All Races
-----------------------------------------
-- Magic Regen While Healing 4
-- Vermin Killer 10
-- Poison Resist 10
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,180,4397);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_MPHEAL, 4);
    target:addMod(MOD_VERMIN_KILLER, 10);
    target:addMod(MOD_POISONRES, 10);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_MPHEAL, 4);
    target:delMod(MOD_VERMIN_KILLER, 10);
    target:delMod(MOD_POISONRES, 10);
end;

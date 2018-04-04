-----------------------------------------
-- ID: 4520
-- Item: coin_cookie
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Magic Regen While Healing 6
-- Vermin Killer 12
-- Poison Resist 12
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,300,4520);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_MPHEAL, 6);
    target:addMod(MOD_VERMIN_KILLER, 12);
    target:addMod(MOD_POISONRES, 12);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_MPHEAL, 6);
    target:delMod(MOD_VERMIN_KILLER, 12);
    target:delMod(MOD_POISONRES, 12);
end;

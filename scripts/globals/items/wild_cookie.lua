-----------------------------------------
-- ID: 4577
-- Item: wild_cookie
-- Food Effect: 5Min, All Races
-----------------------------------------
-- Aquan killer +12
-- Silence resistance +12
-- MP recovered while healing +5
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,300,4577);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_AQUAN_KILLER, 12);
    target:addMod(MOD_SILENCERES, 12);
    target:addMod(MOD_MPHEAL, 5);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_AQUAN_KILLER, 12);
    target:delMod(MOD_SILENCERES, 12);
    target:delMod(MOD_MPHEAL, 5);
end;

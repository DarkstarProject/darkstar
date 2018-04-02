-----------------------------------------
-- ID: 4320
-- Item: Apple Pie +1
-- Food Effect: 60Min, All Races
-----------------------------------------
-- Magic 30
-- Intelligence 4
-- Magic Regen While Healing 2
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,3600,4320);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_MP, 30);
    target:addMod(MOD_INT, 4);
    target:addMod(MOD_MPHEAL, 2);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_MP, 30);
    target:delMod(MOD_INT, 4);
    target:delMod(MOD_MPHEAL, 2);
end;

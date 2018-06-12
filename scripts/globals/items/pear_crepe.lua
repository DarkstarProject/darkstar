-----------------------------------------
-- ID: 5777
-- Item: Pear Crepe
-- Food Effect: 30 Min, All Races
-----------------------------------------
-- Intelligence +2
-- MP Healing +2
-- Magic Accuracy +20% (cap 45)
-- Magic Defense +1
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,5777);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.INT, 2);
    target:addMod(dsp.mod.FOOD_MACCP, 20);
    target:addMod(dsp.mod.FOOD_MACC_CAP, 45);
    target:addMod(dsp.mod.MDEF, 1);
    target:addMod(dsp.mod.MPHEAL, 2);
end;

function onEffectLose(target, effect)
    target:delMod(dsp.mod.INT, 2);
    target:delMod(dsp.mod.FOOD_MACCP, 20);
    target:delMod(dsp.mod.FOOD_MACC_CAP, 45);
    target:delMod(dsp.mod.MDEF, 1);
    target:delMod(dsp.mod.MPHEAL, 2);
end;

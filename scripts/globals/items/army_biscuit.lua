-----------------------------------------
-- ID: 5657
-- Item: army_biscuit
-- Food Effect: 5Min?, All Races
-----------------------------------------
-- HP Recovered While Healing 3
-- MP Recovered While Healing 3
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,5657);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HPHEAL, 3);
    target:addMod(dsp.mod.MPHEAL, 3);
end;

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HPHEAL, 3);
    target:delMod(dsp.mod.MPHEAL, 3);
end;

-----------------------------------
--
--     dsp.effect.LAST_RESORT
--     
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.ATTP,15 + target:getMerit(dsp.merit.LAST_RESORT_EFFECT));
    target:addMod(dsp.mod.DEFP,-15 - target:getMerit(dsp.merit.LAST_RESORT_EFFECT));
    target:addMod(dsp.mod.HASTE_ABILITY, 156+effect:getPower())
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    target:delMod(dsp.mod.ATTP,15 + target:getMerit(dsp.merit.LAST_RESORT_EFFECT));
    target:delMod(dsp.mod.DEFP,-15 - target:getMerit(dsp.merit.LAST_RESORT_EFFECT));
    target:delMod(dsp.mod.HASTE_ABILITY, 156+effect:getPower())
end;
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
    target:addMod(dsp.mod.ATTP, 15 + target:getMerit(dsp.merit.LAST_RESORT_EFFECT));
    
    effect:setPower(-15 - target:getMerit(dsp.merit.LAST_RESORT_EFFECT) + target:getMod(dsp.mod.LAST_RESORT_DEF_PENALTY));
    target:addMod(dsp.mod.DEFP, effect:getPower());
    
    target:addMod(dsp.mod.HASTE_ABILITY, target:getMod(dsp.mod.DESPERATE_BLOWS) + target:getMerit(dsp.merit.DESPERATE_BLOWS));
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
    target:delMod(dsp.mod.ATTP, 15 + target:getMerit(dsp.merit.LAST_RESORT_EFFECT));
    target:delMod(dsp.mod.DEFP, effect:getPower());
    target:delMod(dsp.mod.HASTE_ABILITY, target:getMod(dsp.mod.DESPERATE_BLOWS) + target:getMerit(dsp.merit.DESPERATE_BLOWS));
end;
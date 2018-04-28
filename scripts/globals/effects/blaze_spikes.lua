-----------------------------------
--
-- dsp.effect.BLAZE_SPIKES
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.SPIKES,1);
    target:addMod(dsp.mod.SPIKES_DMG, effect:getPower());
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
    target:delMod(dsp.mod.SPIKES,1);
    target:delMod(dsp.mod.SPIKES_DMG, effect:getPower());
end;

-----------------------------------
--
-- dsp.effect.SHELL
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
   target:addMod(dsp.mod.DMGMAGIC,-effect:getPower())
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
   target:delMod(dsp.mod.DMGMAGIC,-effect:getPower())
end
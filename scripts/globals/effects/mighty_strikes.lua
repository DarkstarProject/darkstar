-----------------------------------
--
--     dsp.effect.MIGHTY_STRIKES
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
target:addMod(dsp.mod.CRITHITRATE,100)
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
target:addMod(dsp.mod.CRITHITRATE,-100)
end
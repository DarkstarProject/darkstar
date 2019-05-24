-----------------------------------
--
--
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.TRIPLE_ATTACK, effect:getPower())
    target:addMod(dsp.mod.DOUBLE_ATTACK, 100)
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.TRIPLE_ATTACK, effect:getPower())
    target:delMod(dsp.mod.DOUBLE_ATTACK, 100)
end
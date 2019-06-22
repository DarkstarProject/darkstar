-----------------------------------
--
--
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.COUNTER,(target:getMod(dsp.mod.ZANSHIN)/4))
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.COUNTER,(target:getMod(dsp.mod.ZANSHIN)/4))
end

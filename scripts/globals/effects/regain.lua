-----------------------------------
--    Regain
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.REGAIN, effect:getPower() * 10)
end

function onEffectTick(target,effect)

end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.REGAIN, effect:getPower() * 10)
end
-----------------------------------
--
--     dsp.effect.HAGAKURE
--
-----------------------------------

require("scripts/globals/status")

function onEffectGain(target,effect)
    target:addMod(dsp.mod.SAVETP,400)
    target:addMod(dsp.mod.TP_BONUS,1000)
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.SAVETP,400)
    target:delMod(dsp.mod.TP_BONUS,1000)
end

-----------------------------------
--
--
--
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(tpz.mod.MEVA, -25)
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(tpz.mod.MEVA, -25)
end
-----------------------------------
--
--
--
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(tpz.mod.DEFP, -13)
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(tpz.mod.DEFP, -13)
end
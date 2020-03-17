-----------------------------------
--
--
--
-----------------------------------

require("scripts/globals/status")

function onEffectGain(target,effect)
    target:addMod(tpz.mod.ATTP, effect:getPower())
    target:addMod(tpz.mod.RATTP, effect:getPower())
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(tpz.mod.ATTP, effect:getPower())
    target:delMod(tpz.mod.RATTP, effect:getPower())
end

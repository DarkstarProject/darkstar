-----------------------------------
--
-- tpz.effect.CONSPIRATOR
--
-----------------------------------
require("scripts/globals/status")

function onEffectGain(target,effect)
    target:addMod(tpz.mod.SUBTLE_BLOW, effect:getPower())
    target:addMod(tpz.mod.ACC, effect:getSubPower())
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(tpz.mod.SUBTLE_BLOW, effect:getPower())
    target:delMod(tpz.mod.ACC, effect:getSubPower())
end

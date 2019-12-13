-----------------------------------
--
-- dsp.effect.EVASION_DOWN
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    local power = math.min(effect:getPower(), target:getStat(dsp.mod.EVA))
    effect:setPower(power)
    target:delMod(dsp.mod.EVA, power)
end

-- only Feint uses tick, which restores 10 evasion per tick
function onEffectTick(target, effect)
    local power = effect:getPower()
    local adj = math.min(power, 10)
    effect:setPower(power - adj)
    target:addMod(dsp.mod.EVA, adj)
end

function onEffectLose(target, effect)
    local power = effect:getPower()
    target:addMod(dsp.mod.EVA, power)
end

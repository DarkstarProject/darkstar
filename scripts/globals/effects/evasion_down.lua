-----------------------------------
--
-- dsp.effect.EVASION_DOWN
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    if target:getStat(dsp.mod.EVA) - effect:getPower() < 0 then
        effect:setPower(target:getStat(dsp.mod.EVA))
    end
    target:addMod(dsp.mod.EVA, -effect:getPower())
end

function onEffectTick(target,effect)
    -- Only Feint uses the tick, restore 10 evasion every tick
    local evaDownAmt = effect:getPower()
    if evaDownAmt > 0 then
        effect:setPower(math.max(evaDownAmt - 10, 0))
        target:delMod(dsp.mod.EVA, 10)
    end
end

function onEffectLose(target,effect)
    local evaDownAmt = effect:getPower()
    if evaDownAmt > 0 then
        target:delMod(dsp.mod.EVA, effect:getPower())
    end
end

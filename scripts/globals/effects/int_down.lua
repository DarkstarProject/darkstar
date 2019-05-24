-----------------------------------
--
--     dsp.effect.INT_DOWN
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    if ((target:getStat(dsp.mod.INT) - effect:getPower()) < 0) then
        effect:setPower(target:getStat(dsp.mod.INT))
    end
    target:addMod(dsp.mod.INT,-effect:getPower())
end

function onEffectTick(target,effect)
    -- the effect restore intelligence of 1 every 3 ticks.
    local downINT_effect_size = effect:getPower()
    if (downINT_effect_size > 0) then
        effect:setPower(downINT_effect_size - 1)
        target:delMod(dsp.mod.INT,-1)
    end
end

function onEffectLose(target,effect)
    local downINT_effect_size = effect:getPower()
    if (downINT_effect_size > 0) then
        target:delMod(dsp.mod.INT,-downINT_effect_size)
    end
end

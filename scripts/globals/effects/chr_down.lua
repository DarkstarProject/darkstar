-----------------------------------
--
-- dsp.effect.CHR_DOWN
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    if ((target:getStat(dsp.mod.CHR) - effect:getPower()) < 0) then
        effect:setPower(target:getStat(dsp.mod.CHR))
    end
    target:addMod(dsp.mod.CHR,-effect:getPower())
end

function onEffectTick(target,effect)
    -- the effect restore charism of 1 every 3 ticks.
    local downCHR_effect_size = effect:getPower()
    if (downCHR_effect_size > 0) then
        effect:setPower(downCHR_effect_size - 1)
        target:delMod(dsp.mod.CHR,-1)
    end
end

function onEffectLose(target,effect)
    downCHR_effect_size = effect:getPower()
    if (downCHR_effect_size > 0) then
        target:delMod(dsp.mod.CHR,-downCHR_effect_size)
    end
end

-----------------------------------
--
--     dsp.effect.STR_DOWN
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    if ((target:getStat(dsp.mod.STR) - effect:getPower()) < 0) then
        effect:setPower(target:getStat(dsp.mod.STR))
    end
    target:addMod(dsp.mod.STR,-effect:getPower())
end

function onEffectTick(target,effect)
    -- the effect restore strengh of 1 every 3 ticks.
    local downSTR_effect_size = effect:getPower()
    if (downSTR_effect_size > 0) then
        effect:setPower(downSTR_effect_size - 1)
        target:delMod(dsp.mod.STR,-1)
    end
end

function onEffectLose(target,effect)
    local downSTR_effect_size = effect:getPower()
    if (downSTR_effect_size > 0) then
        target:delMod(dsp.mod.STR,-downSTR_effect_size)
    end
end

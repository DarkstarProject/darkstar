-----------------------------------
--
-- dsp.effect.INT_BOOST
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.INT,effect:getPower())
end

function onEffectTick(target,effect)
    -- the effect loses intelligence of 1 every 3 ticks depending on the source of the boost
    local boostINT_effect_size = effect:getPower()
    if (boostINT_effect_size > 0) then
        effect:setPower(boostINT_effect_size - 1)
        target:delMod(dsp.mod.INT,1)
    end
end

function onEffectLose(target,effect)
    local boostINT_effect_size = effect:getPower()
    if (boostINT_effect_size > 0) then
        target:delMod(dsp.mod.INT,boostINT_effect_size)
    end
end

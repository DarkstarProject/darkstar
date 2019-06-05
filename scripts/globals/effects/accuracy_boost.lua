-----------------------------------
--
-- dsp.effect.ACCURACY_BOOST
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.ACC,effect:getPower())
end

function onEffectTick(target,effect)
    -- the effect loses accuracy of 1 every 3 ticks depending on the source of the acc boost
    local boostACC_effect_size = effect:getPower()
    if (boostACC_effect_size > 0) then
        effect:setPower(boostACC_effect_size - 1)
        target:delMod(dsp.mod.ACC,1)
    end
end

function onEffectLose(target,effect)
    local boostACC_effect_size = effect:getPower()
    if (boostACC_effect_size > 0) then
        target:delMod(dsp.mod.ACC,effect:getPower())
    end
end

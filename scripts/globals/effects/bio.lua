-----------------------------------
--
-- dsp.effect.BIO
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    local power = effect:getPower()
    local subpower = effect:getSubPower()
    target:addMod(dsp.mod.ATTP,-subpower)
    target:addMod(dsp.mod.REGEN_DOWN, power)
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    local power = effect:getPower()
    local subpower = effect:getSubPower()
    target:delMod(dsp.mod.ATTP,-subpower)
    target:delMod(dsp.mod.REGEN_DOWN, power)
end

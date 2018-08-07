-----------------------------------
--
--
--
-----------------------------------

function onEffectGain(target,effect)
    local regen = effect:getPower()
    local refresh = effect:getSubPower()
    local haste = effect:getTier()

    target:addMod(dsp.mod.REGEN, regen)
    target:addMod(dsp.mod.REFRESH, refresh)
    target:addMod(dsp.mod.HASTE_MAGIC, haste)
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    local regen = effect:getPower()
    local refresh = effect:getSubPower()
    local haste = effect:getTier()

    target:delMod(dsp.mod.REGEN, regen)
    target:delMod(dsp.mod.REFRESH, refresh)
    target:delMod(dsp.mod.HASTE_MAGIC, haste)
end
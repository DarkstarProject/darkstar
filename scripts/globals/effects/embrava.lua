-----------------------------------
--
--
--
-----------------------------------

function onEffectGain(target,effect)
    local skill = effect:getPower()
    local regen = math.floor(skill / 7) + 1
    local refresh = math.floor(skill / 100) + 1
    local haste = (math.floor(skill / 20) + 1) * 100

    target:addMod(dsp.mod.REGEN, regen)
    target:addMod(dsp.mod.REFRESH, refresh)
    target:addMod(dsp.mod.HASTE_MAGIC, haste)
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    local skill = effect:getPower()
    local regen = math.floor(skill / 7) + 1
    local refresh = math.floor(skill / 100) + 1
    local haste = (math.floor(skill / 20) + 1) * 100

    target:delMod(dsp.mod.REGEN, regen)
    target:delMod(dsp.mod.REFRESH, refresh)
    target:delMod(dsp.mod.HASTE_MAGIC, haste)
end
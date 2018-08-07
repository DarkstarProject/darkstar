-----------------------------------
--
--
--
-----------------------------------

function onEffectGain(target,effect)
    local regen = effect:getSubPower()
    local helix = effect:getPower()

    if (target:hasStatusEffect(dsp.effect.LIGHT_ARTS) or target:hasStatusEffect(dsp.effect.ADDENDUM_WHITE)) then
        target:addMod(dsp.mod.BLACK_MAGIC_COST, -30)
        target:addMod(dsp.mod.BLACK_MAGIC_CAST, -30)
        target:addMod(dsp.mod.BLACK_MAGIC_RECAST, -30)
        target:addMod(dsp.mod.LIGHT_ARTS_REGEN, math.ceil(regen/1.5))
        target:addMod(dsp.mod.REGEN_DURATION, math.ceil((regen*2)/1.5))
        target:addMod(dsp.mod.HELIX_EFFECT, helix)
        target:addMod(dsp.mod.HELIX_DURATION, 108)
    elseif (target:hasStatusEffect(dsp.effect.DARK_ARTS) or target:hasStatusEffect(dsp.effect.ADDENDUM_BLACK)) then
        target:addMod(dsp.mod.WHITE_MAGIC_COST, -30)
        target:addMod(dsp.mod.WHITE_MAGIC_CAST, -30)
        target:addMod(dsp.mod.WHITE_MAGIC_RECAST, -30)
        target:addMod(dsp.mod.LIGHT_ARTS_REGEN, regen)
        target:addMod(dsp.mod.REGEN_DURATION, regen*2)
        target:addMod(dsp.mod.HELIX_EFFECT, math.ceil(helix/1.5))
        target:addMod(dsp.mod.HELIX_DURATION, 36)
    else
        target:addMod(dsp.mod.BLACK_MAGIC_COST, -10)
        target:addMod(dsp.mod.BLACK_MAGIC_CAST, -10)
        target:addMod(dsp.mod.BLACK_MAGIC_RECAST, -10)
        target:addMod(dsp.mod.WHITE_MAGIC_COST, -10)
        target:addMod(dsp.mod.WHITE_MAGIC_CAST, -10)
        target:addMod(dsp.mod.WHITE_MAGIC_RECAST, -10)
        target:addMod(dsp.mod.LIGHT_ARTS_REGEN, regen)
        target:addMod(dsp.mod.REGEN_DURATION, regen*2)
        target:addMod(dsp.mod.HELIX_EFFECT, helix)
        target:addMod(dsp.mod.HELIX_DURATION, 108)
    end
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    local regen = effect:getSubPower()
    local helix = effect:getPower()

    if (target:hasStatusEffect(dsp.effect.LIGHT_ARTS) or target:hasStatusEffect(dsp.effect.ADDENDUM_WHITE)) then
        target:delMod(dsp.mod.BLACK_MAGIC_COST, -30)
        target:delMod(dsp.mod.BLACK_MAGIC_CAST, -30)
        target:delMod(dsp.mod.BLACK_MAGIC_RECAST, -30)
        target:delMod(dsp.mod.LIGHT_ARTS_REGEN, math.ceil(regen/1.5))
        target:delMod(dsp.mod.REGEN_DURATION, math.ceil((regen*2)/1.5))
        target:delMod(dsp.mod.HELIX_EFFECT, helix)
        target:delMod(dsp.mod.HELIX_DURATION, 108)
    elseif (target:hasStatusEffect(dsp.effect.DARK_ARTS) or target:hasStatusEffect(dsp.effect.ADDENDUM_BLACK)) then
        target:delMod(dsp.mod.WHITE_MAGIC_COST, -30)
        target:delMod(dsp.mod.WHITE_MAGIC_CAST, -30)
        target:delMod(dsp.mod.WHITE_MAGIC_RECAST, -30)
        target:delMod(dsp.mod.LIGHT_ARTS_REGEN, regen)
        target:delMod(dsp.mod.REGEN_DURATION, regen*2)
        target:delMod(dsp.mod.HELIX_EFFECT, math.ceil(helix/1.5))
        target:delMod(dsp.mod.HELIX_DURATION, 36)
    else
        target:delMod(dsp.mod.BLACK_MAGIC_COST, -10)
        target:delMod(dsp.mod.BLACK_MAGIC_CAST, -10)
        target:delMod(dsp.mod.BLACK_MAGIC_RECAST, -10)
        target:delMod(dsp.mod.WHITE_MAGIC_COST, -10)
        target:delMod(dsp.mod.WHITE_MAGIC_CAST, -10)
        target:delMod(dsp.mod.WHITE_MAGIC_RECAST, -10)
        target:delMod(dsp.mod.LIGHT_ARTS_REGEN, regen)
        target:delMod(dsp.mod.REGEN_DURATION, regen*2)
        target:delMod(dsp.mod.HELIX_EFFECT, helix)
        target:delMod(dsp.mod.HELIX_DURATION, 108)
    end
end
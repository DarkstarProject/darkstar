-----------------------------------
--
--
--
-----------------------------------

function onEffectGain(target,effect)
    target:recalculateAbilitiesTable()
    local bonus = effect:getPower()
    local regen = effect:getSubPower()

    target:addMod(dsp.mod.WHITE_MAGIC_COST, -bonus)
    target:addMod(dsp.mod.WHITE_MAGIC_CAST, -bonus)
    target:addMod(dsp.mod.WHITE_MAGIC_RECAST, -bonus)

    if not (target:hasStatusEffect(dsp.effect.TABULA_RASA)) then
        target:addMod(dsp.mod.WHITE_MAGIC_COST, -10)
        target:addMod(dsp.mod.WHITE_MAGIC_CAST, -10)
        target:addMod(dsp.mod.WHITE_MAGIC_RECAST, -10)
        target:addMod(dsp.mod.BLACK_MAGIC_COST, 20)
        target:addMod(dsp.mod.BLACK_MAGIC_CAST, 20)
        target:addMod(dsp.mod.BLACK_MAGIC_RECAST, 20)
        target:addMod(dsp.mod.LIGHT_ARTS_REGEN, regen)
        target:addMod(dsp.mod.REGEN_DURATION, regen*2)
    end
    target:recalculateSkillsTable()
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:recalculateAbilitiesTable()
    local bonus = effect:getPower()
    local regen = effect:getSubPower()

    target:delMod(dsp.mod.WHITE_MAGIC_COST, -bonus)
    target:delMod(dsp.mod.WHITE_MAGIC_CAST, -bonus)
    target:delMod(dsp.mod.WHITE_MAGIC_RECAST, -bonus)

    if not (target:hasStatusEffect(dsp.effect.TABULA_RASA)) then
        target:delMod(dsp.mod.WHITE_MAGIC_COST, -10)
        target:delMod(dsp.mod.WHITE_MAGIC_CAST, -10)
        target:delMod(dsp.mod.WHITE_MAGIC_RECAST, -10)
        target:delMod(dsp.mod.BLACK_MAGIC_COST, 20)
        target:delMod(dsp.mod.BLACK_MAGIC_CAST, 20)
        target:delMod(dsp.mod.BLACK_MAGIC_RECAST, 20)
        target:delMod(dsp.mod.LIGHT_ARTS_REGEN, regen)
        target:delMod(dsp.mod.REGEN_DURATION, regen*2)
    end
    target:recalculateSkillsTable()
end
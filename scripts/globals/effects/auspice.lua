--------------------------------------
--
-- dsp.effect.AUSPICE
--
-- Power: Used for Enspell Effect
-- SubPower: Tracks Subtle Blow Bonus
-- Tier: Used for Enspell Calculation
--
--------------------------------------

function onEffectGain(target,effect)
    --Auspice Reduces TP via adding to your Subtle Blow Mod
    local subtleBlowBonus = 10 + target:getMod(dsp.mod.AUSPICE_EFFECT)
    --printf("AUSPICE: Adding Subtle Blow +%d!", subtleBlowBonus)
    effect:setSubPower(subtleBlowBonus)
    target:addMod(dsp.mod.SUBTLE_BLOW, subtleBlowBonus)

    --Afflatus Misery Bonuses
    if (target:hasStatusEffect(dsp.effect.AFFLATUS_MISERY)) then
        target:getStatusEffect(dsp.effect.AFFLATUS_MISERY):setSubPower(0)
        target:addMod(dsp.mod.ENSPELL,18)
        target:addMod(dsp.mod.ENSPELL_DMG,effect:getPower())
    end
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    local subtleBlow = effect:getSubPower()
    --printf("AUSPICE: Removing Subtle Blow +%d!", subtleBlow)
    target:delMod(dsp.mod.SUBTLE_BLOW, subtleBlow)

    --Clean Up Any Bonuses That From Afflatus Misery Combo
    if (target:hasStatusEffect(dsp.effect.AFFLATUS_MISERY)) then
        local accuracyBonus = target:getStatusEffect(dsp.effect.AFFLATUS_MISERY):getSubPower()
        --printf("AUSPICE: Removing Accuracy Bonus +%d!", accuracyBonus)
        target:delMod(dsp.mod.ACC, accuracyBonus)
        local accuracyBonus = target:getStatusEffect(dsp.effect.AFFLATUS_MISERY):setSubPower(0)

        target:setMod(dsp.mod.ENSPELL_DMG,0)
        target:setMod(dsp.mod.ENSPELL,0)
    end

end
-----------------------------------
--
-- dsp.effect.AFFLATUS_MISERY
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    target:setMod(dsp.mod.AFFLATUS_MISERY,0)

    if (target:hasStatusEffect(dsp.effect.AUSPICE)) then
        local power = target:getStatusEffect(dsp.effect.AUSPICE):getPower()
        target:addMod(dsp.mod.ENSPELL,18)
        target:addMod(dsp.mod.ENSPELL_DMG, power)
    end
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:setMod(dsp.mod.AFFLATUS_MISERY,0)

    --Clean Up Afflatus Misery Bonuses
    local accuracyBonus = effect:getSubPower()
    --printf("AUSPICE: Removing Accuracy Bonus +%d!", accuracyBonus)
    target:delMod(dsp.mod.ACC, accuracyBonus)

    if (target:hasStatusEffect(dsp.effect.AUSPICE)) then
        target:setMod(dsp.mod.ENSPELL,0)
        target:setMod(dsp.mod.ENSPELL_DMG, 0)
    end
end
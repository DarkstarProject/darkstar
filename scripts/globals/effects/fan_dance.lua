-----------------------------------
--
-- dsp.effect.FAN_DANCE
--
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    -- Waltz recast effect is handled in the waltz scripts
    target:delStatusEffect(dsp.effect.HASTE_SAMBA)
    target:delStatusEffect(dsp.effect.ASPIR_SAMBA)
    target:delStatusEffect(dsp.effect.DRAIN_SAMBA)
    target:delStatusEffect(dsp.effect.SABER_DANCE)
    target:addMod(dsp.mod.ENMITY, 15)
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.ENMITY, 15)
end
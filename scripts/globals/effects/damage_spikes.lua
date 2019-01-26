-----------------------------------
--
-- dsp.effect.DAMAGE_SPIKES
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    -- TODO: Is this non elemental damage? Physical? Fire?
    -- Why would SE use a separate status effects from blaze spikes if its fire though..
    target:addMod(dsp.mod.SPIKES,1)
    target:addMod(dsp.mod.SPIKES_DMG, effect:getPower())
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.SPIKES,1)
    target:delMod(dsp.mod.SPIKES_DMG, effect:getPower())
end

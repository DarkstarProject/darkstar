-----------------------------------
--
--
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.SPIKES,6)
     -- Spike damage is calculated on hit in battleutils::TakePhysicalDamage
    target:setMod(dsp.mod.SPIKES_DMG, 0)
    target:addMod(dsp.mod.SHIELDBLOCKRATE, 50)
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.SPIKES,6)
    target:setMod(dsp.mod.SPIKES_DMG, 0)
    target:delMod(dsp.mod.SHIELDBLOCKRATE, 50)
end
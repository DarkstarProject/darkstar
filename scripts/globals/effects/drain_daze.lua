-----------------------------------
--
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.ENSPELL_DMG, 0)
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:setMod(dsp.mod.ENSPELL_DMG, 0)
end

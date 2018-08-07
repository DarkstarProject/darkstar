-----------------------------------
--
--
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.ENSPELL,16)
    target:addMod(dsp.mod.ENSPELL_DMG,1)
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:setMod(dsp.mod.ENSPELL_DMG,0)
    target:setMod(dsp.mod.ENSPELL,0)
end
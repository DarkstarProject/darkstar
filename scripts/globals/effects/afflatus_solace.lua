-----------------------------------
--
-- dsp.effect.AFFLATUS_SOLACE
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.AFFLATUS_SOLACE,0)
    target:addMod(dsp.mod.BARSPELL_MDEF_BONUS,5)
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.AFFLATUS_SOLACE,0)
    target:delMod(dsp.mod.BARSPELL_MDEF_BONUS,5)
end
-----------------------------------
--
-- dsp.effect.AFFLATUS_SOLACE
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.AFFLATUS_SOLACE,0);
    target:addMod(dsp.mod.BARSPELL_MDEF_BONUS,5);
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    target:delMod(dsp.mod.AFFLATUS_SOLACE,0);
    target:delMod(dsp.mod.BARSPELL_MDEF_BONUS,5);
end;
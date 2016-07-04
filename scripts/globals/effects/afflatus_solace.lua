-----------------------------------
--
-- EFFECT_AFFLATUS_SOLACE
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_AFFLATUS_SOLACE,0);
    target:addMod(MOD_BARSPELL_MDEF_BONUS,5);
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
    target:delMod(MOD_AFFLATUS_SOLACE,0);
    target:delMod(MOD_BARSPELL_MDEF_BONUS,5);
end;
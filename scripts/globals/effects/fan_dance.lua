-----------------------------------
--
-- dsp.effect.FAN_DANCE
--
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    -- Waltz recast effect is handled in the waltz scripts
    target:delStatusEffect(dsp.effect.HASTE_SAMBA);
    target:delStatusEffect(dsp.effect.ASPIR_SAMBA);
    target:delStatusEffect(dsp.effect.DRAIN_SAMBA);
    target:delStatusEffect(dsp.effect.SABER_DANCE);
    target:addMod(dsp.mod.ENMITY, 15);
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
    target:delMod(dsp.mod.ENMITY, 15);
end;
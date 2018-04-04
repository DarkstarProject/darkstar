-----------------------------------
--
-- dsp.effects.FAN_DANCE
--
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    -- Waltz recast effect is handled in the waltz scripts
    target:delStatusEffect(dsp.effects.HASTE_SAMBA);
    target:delStatusEffect(dsp.effects.ASPIR_SAMBA);
    target:delStatusEffect(dsp.effects.DRAIN_SAMBA);
    target:delStatusEffect(dsp.effects.SABER_DANCE);
    target:addMod(MOD_ENMITY, 15);
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
    target:delMod(MOD_ENMITY, 15);
end;
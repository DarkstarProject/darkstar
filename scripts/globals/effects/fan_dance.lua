-----------------------------------
--
-- EFFECT_FAN_DANCE
--
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    -- Waltz recast effect is handled in the waltz scripts
    target:delStatusEffect(EFFECT_HASTE_SAMBA);
    target:delStatusEffect(EFFECT_ASPIR_SAMBA);
    target:delStatusEffect(EFFECT_DRAIN_SAMBA);
    target:delStatusEffect(EFFECT_SABER_DANCE);
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
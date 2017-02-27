-----------------------------------
--
-- EFFECT_DAMAGE_SPIKES
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    -- TODO: Is this non elemental damage? Physical? Fire?
    -- Why would SE use a separate status effects from blaze spikes if its fire though..
    target:addMod(MOD_SPIKES,1);
    target:addMod(MOD_SPIKES_DMG, effect:getPower());
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
    target:delMod(MOD_SPIKES,1);
    target:delMod(MOD_SPIKES_DMG, effect:getPower());
end;

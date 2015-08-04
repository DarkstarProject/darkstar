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
    local fanDanceMerits = target:getMerit(MERIT_FAN_DANCE);
    if (fanDanceMerits >5) then
        target:addMod(MOD_WALTZ_RECAST, (fanDanceMerits-5));
    end
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
    local fanDanceMerits = target:getMerit(MERIT_FAN_DANCE);
    if (fanDanceMerits >5) then
        target:delMod(MOD_WALTZ_RECAST, (fanDanceMerits-5));
    end
    target:delMod(MOD_ENMITY, 15);
end;
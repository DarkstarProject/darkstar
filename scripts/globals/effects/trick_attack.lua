-----------------------------------
--
--  EFFECT_TRICK_ATTACK
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_CRIT_DMG_INCREASE,(target:getMod(MOD_AUGMENTS_TA)));
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
    target:delMod(MOD_CRIT_DMG_INCREASE,(target:getMod(MOD_AUGMENTS_TA)));
end;
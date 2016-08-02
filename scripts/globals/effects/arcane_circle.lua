-----------------------------------
--
--     EFFECT_ARCANE_CIRCLE
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
   target:addMod(MOD_ARCANA_KILLER, effect:getPower());
   target:addMod(MOD_ARCANA_DAMAGE_BONUS,effect:getPower())
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
   target:delMod(MOD_ARCANA_KILLER, effect:getPower());
   target:delMod(MOD_ARCANA_DAMAGE_BONUS,effect:getPower())
end;

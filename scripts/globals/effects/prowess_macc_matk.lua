-----------------------------------
--
-- EFFECT_PROWESS : Enhanced magic acc. and magic atk
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_MATT, effect:getPower());
    target:addMod(MOD_MACC, effect:getPower());
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
    target:delMod(MOD_MATT, effect:getPower());
    target:delMod(MOD_MACC, effect:getPower());
end;
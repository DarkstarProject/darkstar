-----------------------------------
--
-- EFFECT_PROWESS : Enhanced accuracy and ranged accuracy
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
-- This might not be % in retail...If not a % just change ACCP to just ACC
    target:addMod(MOD_ACC, effect:getPower());
    target:addMod(MOD_RACC, effect:getPower());
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
    target:delMod(MOD_ACC, effect:getPower());
    target:delMod(MOD_RACC, effect:getPower());
end;

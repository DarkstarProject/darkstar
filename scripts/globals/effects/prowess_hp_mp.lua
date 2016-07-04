-----------------------------------
--
-- EFFECT_PROWESS : Increased HP and MP
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HPP, effect:getPower());
    target:addMod(MOD_MPP, effect:getPower());
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
    target:delMod(MOD_HPP, effect:getPower());
    target:delMod(MOD_MPP, effect:getPower());
end;
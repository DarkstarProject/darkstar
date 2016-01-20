-----------------------------------
--
--     EFFECT_BERSERK
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_ACC,15 + effect:getPower());
    target:addMod(MOD_HPP,-15);
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
    target:delMod(MOD_ACC,15 + effect:getPower());
    target:delMod(MOD_HPP,-15);
end;
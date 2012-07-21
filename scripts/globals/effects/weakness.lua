-----------------------------------
--
-- Weakness
--
-----------------------------------
require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    --reduce HP and MP by the power amount. Add 100% slow
    --NOTE: The power amount dictates the amount to REDUCE MAX VALUES BY. E.g. Power=75 means 'reduce max hp/mp by 75%'
    target:addMod(MOD_HPP,-75);
    target:addMod(MOD_MPP,-75);
    target:addMod(MOD_HASTE,-100);
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
    --restore HP and MP to its former state. Remove 100% slow
    target:delMod(MOD_HPP,-75);
    target:delMod(MOD_MPP,-75);
    target:delMod(MOD_HASTE,-100);
end;
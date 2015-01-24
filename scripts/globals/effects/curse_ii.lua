-----------------------------------
-----------------------------------
--	EFFECT_CURSE_II
-- Curse is a harmful status
-- effect that inflicts a number
-- of bad effects until it wears
-- off (which can be from 5 to 35
-- minutes real time) or is
-- removed. Afflicted characters
-- have their maximum HP, MP, and
-- Movement Speed reduced
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    --NOTE: The power amount dictates the amount to REDUCE MAX VALUES BY. E.g. Power=75 means 'reduce max hp/mp by 75%'
    target:addMod(MOD_HPP,-effect:getPower());
    target:addMod(MOD_MPP,-effect:getPower());
    target:addMod(MOD_MOVE,-effect:getPower());
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
    target:delMod(MOD_HPP,-effect:getPower());
    target:delMod(MOD_MPP,-effect:getPower());
    target:delMod(MOD_MOVE,-effect:getPower());
end;
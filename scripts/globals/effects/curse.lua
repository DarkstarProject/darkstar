-----------------------------------
--
--
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    --NOTE: The power amount dictates the amount to REDUCE MAX VALUES BY. E.g. Power=75 means 'reduce max hp/mp by 75%'
    target:addMod(dsp.mod.HPP,-effect:getPower())
    target:addMod(dsp.mod.MPP,-effect:getPower())
    target:addMod(dsp.mod.MOVE,-effect:getPower())
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    --restore HP and MP to its former state. Remove 100% slow
    target:delMod(dsp.mod.HPP,-effect:getPower())
    target:delMod(dsp.mod.MPP,-effect:getPower())
    target:delMod(dsp.mod.MOVE,-effect:getPower())
end
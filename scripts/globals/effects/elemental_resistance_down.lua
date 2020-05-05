-----------------------------------
--
--     dsp.effect.ELEMENTALRES_DOWN
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.FIRERES, -effect:getPower())
    target:addMod(dsp.mod.ICERES, -effect:getPower())
    target:addMod(dsp.mod.WINDRES, -effect:getPower())
    target:addMod(dsp.mod.EARTHRES, -effect:getPower())
    target:addMod(dsp.mod.THUNDERRES, -effect:getPower())
    target:addMod(dsp.mod.WATERRES, -effect:getPower())
    target:addMod(dsp.mod.LIGHTRES, -effect:getPower())
    target:addMod(dsp.mod.DARKRES, -effect:getPower())
end

function onEffectTick(target,effect)
end


function onEffectLose(target,effect)
    target:delMod(dsp.mod.FIRERES, -effect:getPower())
    target:delMod(dsp.mod.ICERES, -effect:getPower())
    target:delMod(dsp.mod.WINDRES, -effect:getPower())
    target:delMod(dsp.mod.EARTHRES, -effect:getPower())
    target:delMod(dsp.mod.THUNDERRES, -effect:getPower())
    target:delMod(dsp.mod.WATERRES, -effect:getPower())
    target:delMod(dsp.mod.LIGHTRES, -effect:getPower())
    target:delMod(dsp.mod.DARKRES, -effect:getPower())
end
-----------------------------------
--
-- dsp.effect.BURN
--
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.REGEN_DOWN, effect:getPower())
    target:addMod(dsp.mod.INT, -getElementalDebuffStatDownFromDOT(effect:getPower()) - effect:getSubPower())
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.REGEN_DOWN, effect:getPower())
    target:delMod(dsp.mod.INT, -getElementalDebuffStatDownFromDOT(effect:getPower()) - effect:getSubPower())
end
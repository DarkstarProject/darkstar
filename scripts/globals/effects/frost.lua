-----------------------------------
--
--     tpz.effect.FROST
--
-----------------------------------

require("scripts/globals/status")
require("scripts/globals/magic")

function onEffectGain(target,effect)
    target:addMod(tpz.mod.REGEN_DOWN, effect:getPower())
    target:addMod(tpz.mod.AGI, -getElementalDebuffStatDownFromDOT(effect:getPower()) - effect:getSubPower())
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(tpz.mod.REGEN_DOWN, effect:getPower())
    target:delMod(tpz.mod.AGI, -getElementalDebuffStatDownFromDOT(effect:getPower()) - effect:getSubPower())
end

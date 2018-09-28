-----------------------------------
--
-- dsp.effect.ASSASSINS_CHARGE
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.QUAD_ATTACK, effect:getPower())
    target:addMod(dsp.mod.TRIPLE_ATTACK, 100)
    if (effect:getSubType() > 0) then
        target:addMod(dsp.mod.CRITHITRATE, effect:getSubPower())
    end
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.QUAD_ATTACK, effect:getPower())
    target:delMod(dsp.mod.TRIPLE_ATTACK, 100)
    if (effect:getSubPower() > 0) then -- dsp.mod.AUGMENTS_ASSASSINS_CHARGE
        target:delMod(dsp.mod.CRITHITRATE, effect:getSubPower())
    end
end
-----------------------------------
--
-- dsp.effect.MAGIC_DEF_BOOST
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    if (effect:getPower()>100) then
        effect:setPower(50)
    end
    target:addMod(dsp.mod.MDEF,effect:getPower())
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.MDEF,effect:getPower())
end
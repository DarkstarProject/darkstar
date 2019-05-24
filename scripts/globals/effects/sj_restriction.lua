-----------------------------------
--
--
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    target:sjRestriction(effect:getPower(),true)
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    local power = effect:getPower()
    -- fix crash on logout / login
    if (power > dsp.MAX_JOB_TYPE or power < 0) then
        power = 0
    end

    target:sjRestriction(power,false)
end
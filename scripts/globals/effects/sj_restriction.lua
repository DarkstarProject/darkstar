-----------------------------------
--
--
--
-----------------------------------

require("scripts/globals/status");
-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:sjRestriction(effect:getPower(),true);
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
    local power = effect:getPower();
    -- fix crash on logout / login
    if (power > MAX_JOB_TYPE or power < 0) then
        power = 0;
    end

	target:sjRestriction(power,false);
end;
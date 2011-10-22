-----------------------------------
--
-- 	EFFECT_BATTLEFIELD
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
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

	if (effect:getPower() == 1) then
		if (target:getVar("TheHolyCrest_Killed") == 0) then
			target:setAnimation(0);
			target:startEvent(0x7d02);
			DespawnMob(17350928);
		end
	end
end;

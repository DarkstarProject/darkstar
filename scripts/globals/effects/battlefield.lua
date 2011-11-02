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

	fieldEffect = effect:getPower();

	if (fieldEffect == 1) then
		if (target:getVar("TheHolyCrest_Killed") == 0) then
			target:setAnimation(0);
			target:startEvent(0x7d02);
			DespawnMob(17350928);
		end
	elseif (fieldEffect == 100) then
		pZone = target:getZone();
		if (target:getVar("Mission_2_3_Killed") < 2 and target:getVar(tostring(pZone) .. "_Runaway") == 0) then
			target:setAnimation(0);
			target:startEvent(0x7d02);
			bcnmDespawn(target:getVar(tostring(pZone) .. "Field"),fieldEffect,pZone);
		end
	end
end;

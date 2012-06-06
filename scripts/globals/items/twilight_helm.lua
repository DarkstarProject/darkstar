-----------------------------------------
--	ID: 11798
--	Equip: twilight_helm
--  Adds "Regen" Effect +1 every 3 sec
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	if (target:getEquipID(4) == 11798) then
		target:addStatusEffectEx(EFFECT_AUTO_REGEN,0,1,3,0,11798);
	else
		target:delStatusEffect(EFFECT_AUTO_REGEN,11798);
	end
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
	target:addHP(effect:getPower());
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
end;
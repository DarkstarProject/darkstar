-----------------------------------------
--	ID: 11362
--	Equip: twilight_mail
--  Adds "Refresh" Effect +1 every 3 sec
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	if (target:getEquipID(5) == 11362) then
		target:addStatusEffectEx(EFFECT_AUTO_REFRESH,0,1,3,0,11362);
	else
		target:delStatusEffect(EFFECT_AUTO_REFRESH,11362);
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
	target:addMP(effect:getPower());
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
end;
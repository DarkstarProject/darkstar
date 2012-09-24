-----------------------------------------
--	ID: 10946
--	Equip: clerics_briault_+2
--  Adds "Refresh" Effect +1 every 3 sec
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	if (target:getEquipID(SLOT_NECK) == 10946) then
		target:addStatusEffectEx(EFFECT_AUTO_REFRESH,0,1,3,0,10946);
	else
		target:delStatusEffect(EFFECT_AUTO_REFRESH,10946);
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
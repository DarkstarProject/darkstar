-----------------------------------------
--	ID: 18811
--	Equip: oneiros_grip
--  Adds "Regen" Effect +1 every 3 sec
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	if (target:getEquipID(SLOT_SUB) == 18811) then
		target:addStatusEffectEx(EFFECT_AUTO_REGEN,0,1,3,0,18811);
	else
		target:delStatusEffect(EFFECT_AUTO_REGEN,18811);
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
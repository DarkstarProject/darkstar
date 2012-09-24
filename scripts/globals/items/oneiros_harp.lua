-----------------------------------------
--	ID: 17358
--	Equip: oneiros_harp
--  Adds "Regen" Effect +1 every 3 sec
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	if (target:getEquipID(SLOT_RANGED) == 17358) then
		target:addStatusEffectEx(EFFECT_AUTO_REGEN,0,1,3,0,17358);
	else
		target:delStatusEffect(EFFECT_AUTO_REGEN,17358);
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
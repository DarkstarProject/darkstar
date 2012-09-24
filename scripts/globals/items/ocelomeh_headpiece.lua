-----------------------------------------
--	ID: 10864
--	Equip: ocelomeh_headpiece
--  Adds "Regen" Effect +1 every 3 sec
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	if (target:getEquipID(SLOT_HEAD) == 10864) then
		target:addStatusEffectEx(EFFECT_AUTO_REGEN,0,1,3,0,10864);
	else
		target:delStatusEffect(EFFECT_AUTO_REGEN,10864);
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
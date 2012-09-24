-----------------------------------------
--	ID: 10671
--	Equip: melee_cyclas_+2
--  Adds "Regen" Effect +1 every 3 sec
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	if (target:getEquipID(SLOT_BODY) == 10671) then
		target:addStatusEffectEx(EFFECT_AUTO_REGEN,0,1,3,0,10671);
	else
		target:delStatusEffect(EFFECT_AUTO_REGEN,10671);
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
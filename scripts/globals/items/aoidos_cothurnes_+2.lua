-----------------------------------------
--	ID: 11153
--	Equip: War aoidos_cothurnes_+2
--  Adds "Regen" Effect +1 every 3 sec
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	if (target:getEquipID(SLOT_FEET) == 11153) then
		target:addStatusEffectEx(EFFECT_AUTO_REGEN,0,1,3,0,11153);
	else
		target:delStatusEffect(EFFECT_AUTO_REGEN,11153);
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
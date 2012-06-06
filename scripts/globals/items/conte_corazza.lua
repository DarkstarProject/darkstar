-----------------------------------------
--	ID: 14417
--	Equip: conte_corazza
--  Adds "Regen" Effect +1 every 3 sec
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	if (target:getEquipID(5) == 14417) then
		target:addStatusEffectEx(EFFECT_AUTO_REGEN,0,1,3,0,14417);
	else
		target:delStatusEffect(EFFECT_AUTO_REGEN,14417);
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
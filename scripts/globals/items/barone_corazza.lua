-----------------------------------------
--	ID: 14416
--	Equip: barone_corazza
--  Adds "Regen" Effect +1 every 3 sec
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	if (target:getEquipID(5) == 14416) then
		target:addStatusEffectEx(EFFECT_AUTO_REGEN,0,1,3,0,14416);
	else
		target:delStatusEffect(EFFECT_AUTO_REGEN,14416);
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
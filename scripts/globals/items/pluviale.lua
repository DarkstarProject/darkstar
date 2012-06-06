-----------------------------------------
--	ID: 11361
--	Equip: pluviale
--  Adds "Refresh" Effect +1 every 3 sec
--  Adds "Regen" Effect +1 every 3 sec
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	if (target:getEquipID(5) == 11361) then
		target:addStatusEffectEx(EFFECT_AUTO_REFRESH,0,1,3,0,11361);
		target:addStatusEffectEx(EFFECT_AUTO_REGEN,0,1,3,0,11361);
	else
		target:delStatusEffect(EFFECT_AUTO_REFRESH,11361);
		target:delStatusEffect(EFFECT_AUTO_REGEN,11361);
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
	target:addHP(effect:getPower());
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
end;
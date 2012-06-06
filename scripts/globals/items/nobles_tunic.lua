-----------------------------------------
--	ID: 12605
--	Equip: nobles_tunic
--  Adds "Refresh" Effect +1 every 3 sec
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	if (target:getEquipID(5) == 12605) then
		target:addStatusEffectEx(EFFECT_AUTO_REFRESH,0,1,3,0,12605);
	else
		target:delStatusEffect(EFFECT_AUTO_REFRESH,12605);
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
-----------------------------------------
--	ID: 13749
--	Equip: royal Cloak
--  Adds "Refresh" Effect +1 every 3 sec
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	if (target:getEquipID(5) == 13749) then
		target:addStatusEffectEx(EFFECT_AUTO_REFRESH,0,1,3,0,13749);
	else
		target:delStatusEffect(EFFECT_AUTO_REFRESH,13749);
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
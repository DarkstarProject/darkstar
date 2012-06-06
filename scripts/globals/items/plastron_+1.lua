-----------------------------------------
--	ID: 14383
--	Equip: plastron_+1
--  Adds "Refresh" Effect +1 every 3 sec
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	if (target:getEquipID(5) == 14383) then
		target:addStatusEffectEx(EFFECT_AUTO_REFRESH,0,1,3,0,14383);
	else
		target:delStatusEffect(EFFECT_AUTO_REFRESH,14383);
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
-----------------------------------------
--	ID: 14364
--	Equip: yhel_jacket
--  Adds "Refresh" Effect +1 every 3 sec
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	if (target:getEquipID(SLOT_BODY) == 14364) then
		target:addStatusEffectEx(EFFECT_AUTO_REFRESH,0,1,3,0,14364);
	else
		target:delStatusEffect(EFFECT_AUTO_REFRESH,14364);
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
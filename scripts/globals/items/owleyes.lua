-----------------------------------------
--	ID: 17113
--	Equip: owleyes
--  Adds "Refresh" Effect +1 every 3 sec
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	if (target:getEquipID(SLOT_MAIN) == 17113) then
		target:addStatusEffectEx(EFFECT_AUTO_REFRESH,0,1,3,0,17113);
	else
		target:delStatusEffect(EFFECT_AUTO_REFRESH,17113);
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
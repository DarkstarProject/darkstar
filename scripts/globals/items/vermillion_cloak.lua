-----------------------------------------
--	ID: 13748
--	Equip: Vermillion Cloak
--  Adds "Refresh" Effect +1 every 3 sec
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	if (target:getEquipID(SLOT_BODY) == 13748) then
		target:addStatusEffectEx(EFFECT_AUTO_REFRESH,0,1,3,0,13748);
	else
		target:delStatusEffect(EFFECT_AUTO_REFRESH,13748);
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
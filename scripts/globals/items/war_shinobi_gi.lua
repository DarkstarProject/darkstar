-----------------------------------------
--	ID: 12617
--	Equip: War Shinobi Gi
--  Adds "Refresh" Effect +1 every 3 sec
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	if (target:getEquipID(5) == 12617) then
		target:addStatusEffectEx(EFFECT_AUTO_REGEN,0,1,3,0,12617);
	else
		target:delStatusEffect(EFFECT_AUTO_REGEN,12617);
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
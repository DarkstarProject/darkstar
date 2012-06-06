-----------------------------------------
--	ID: 13279
--	Equip: muscle_belt_+1
--  Adds "Regen" Effect +1 every 3 sec
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	if (target:getEquipID(10) == 13279) then
		target:addStatusEffectEx(EFFECT_AUTO_REGEN,0,1,3,0,13279);
	else
		target:delStatusEffect(EFFECT_AUTO_REGEN,13279);
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
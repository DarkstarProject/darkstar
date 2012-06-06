-----------------------------------------
--	ID: 12573
--	Equip: dusk_jerkin
--  Adds "Regen" Effect +1 every 3 sec
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	if (target:getEquipID(5) == 12573) then
		target:addStatusEffectEx(EFFECT_AUTO_REGEN,0,1,3,0,12573);
	else
		target:delStatusEffect(EFFECT_AUTO_REGEN,12573);
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
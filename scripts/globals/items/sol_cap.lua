-----------------------------------------
--	ID: 16144
--	Equip: sol_cap
--  Adds "Regen" Effect +1 every 3 sec
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	if (target:getEquipID(SLOT_HEAD) == 16144) then
		target:addStatusEffectEx(EFFECT_AUTO_REGEN,0,1,3,0,16144);
	else
		target:delStatusEffect(EFFECT_AUTO_REGEN,16144);
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
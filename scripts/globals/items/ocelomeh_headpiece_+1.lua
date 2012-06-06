-----------------------------------------
--	ID: 10867
--	Equip: ocelomeh_headpiece_+1
--  Adds "Regen" Effect +1 every 3 sec
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	if (target:getEquipID(4) == 10867) then
		target:addStatusEffectEx(EFFECT_AUTO_REGEN,0,1,3,0,10867);
	else
		target:delStatusEffect(EFFECT_AUTO_REGEN,10867);
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
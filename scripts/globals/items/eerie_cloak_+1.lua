-----------------------------------------
--	ID: 11300
--	Equip: eerie cloak +1
--  Adds "Refresh" Effect +1 every 3 sec
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------
-- need to add check for refresh effect
-- Active while the level of your Main Job is a multiple of 13 and Nighttime.
-- (I.E. 18:00-06:00 and Level 13, 26, 39, 52, 65, 78 and 91.) 
function onItemCheck(target)
	if (target:getEquipID(5) == 11289) then
		target:addStatusEffectEx(EFFECT_AUTO_REFRESH,0,1,3,0,11289);
	else
		target:delStatusEffect(EFFECT_AUTO_REFRESH,11289);
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
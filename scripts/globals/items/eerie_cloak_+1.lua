-----------------------------------------
--	ID: 11301
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

function onItemCheck(target, totd)
	if (target:getEquipID(5) == 11301 and totd ~= 4) then
		if (totd == 0 and (VanadielTOTD() == 3 or VanadielTOTD() == 7 or VanadielTOTD() == 8)) or totd == 7) then
			target:addStatusEffectEx(EFFECT_AUTO_REFRESH,0,1,3,0,11301);
		end
	else
		target:delStatusEffect(EFFECT_AUTO_REFRESH,11301);
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
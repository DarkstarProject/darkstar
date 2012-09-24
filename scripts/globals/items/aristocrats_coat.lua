-----------------------------------------
--	ID: 13774
--	Equip: aristocrats_coat
--  Adds "Refresh" Effect +1 every 3 sec
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	if (target:getEquipID(SLOT_BODY) == 13774) then
		target:addStatusEffectEx(EFFECT_AUTO_REFRESH,0,1,3,0,13774);
	else
		target:delStatusEffect(EFFECT_AUTO_REFRESH,13774);
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
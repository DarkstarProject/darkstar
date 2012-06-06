-----------------------------------------
--	ID: 15249
--	Equip: duelists_chapeau_+1
--  Adds "Refresh" Effect +1 every 3 sec
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	if (target:getEquipID(4) == 15249) then
		target:addStatusEffectEx(EFFECT_AUTO_REFRESH,0,1,3,0,15249);
	else
		target:delStatusEffect(EFFECT_AUTO_REFRESH,15249);
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
-----------------------------------------
--	ID: 11289
--	Equip: ixion_cloak
--  Adds "Refresh" Effect +1 every 3 sec
--  Adds "Regen" Effect +1 every 3 sec	
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	if (target:getEquipID(5) == 11289) then
		target:addStatusEffectEx(EFFECT_AUTO_REFRESH,0,1,3,0,11289);
		target:addStatusEffectEx(EFFECT_AUTO_REGEN,0,1,3,1,11289);
	else
		target:delStatusEffect(EFFECT_AUTO_REFRESH,11289);
		target:delStatusEffect(EFFECT_AUTO_REGEN,11289);
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
	target:addHP(effect:getPower());
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
end;
-----------------------------------------
--	ID: 18547
--	Equip: Ravana's Axe
--  Pet: Adds "Regen" Effect +10 every 3 sec
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_MAIN) == 18547 or target:getEquipID(SLOT_SUB) == 18547) then
		pet:addStatusEffectEx(EFFECT_AUTO_REGEN,0,10,3,0,18547);
	else
		pet:delStatusEffect(EFFECT_AUTO_REGEN,18547);
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
	local pet = target:getPet();
	pet:addHP(effect:getPower());
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
end;
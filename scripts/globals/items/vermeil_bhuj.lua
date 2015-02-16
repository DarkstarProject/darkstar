-----------------------------------------
-- ID: 18510
-- Item: Vermeil Bhuj
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(player,target)
    local mainEquip = player:getEquipID(SLOT_MAIN);
    local power = 1;
	if (mainEquip == 18510) then
		target:addStatusEffect(EFFECT_AMNESIA,power,30);
	
	end
	
	return 0;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)	
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
end;
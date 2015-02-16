-----------------------------------------
-- ID: 11389
-- Item: Patin Babouches +1
-- Item Effect: Automation: MATT +5
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_FEET) == 11389) then
		pet:addMod(MOD_MATT, 5);
	else
		pet:delMod(MOD_MATT, 5);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

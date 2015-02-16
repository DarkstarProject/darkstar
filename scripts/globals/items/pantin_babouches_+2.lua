-----------------------------------------
-- ID: 10747
-- Item: Patin Babouches +2
-- Item Effect: Automation: MACC +5
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_FEET) == 10747) then
		pet:addMod(MOD_MACC, 5);
	else
		pet:delMod(MOD_MACC, 5);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

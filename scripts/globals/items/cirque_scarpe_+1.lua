-----------------------------------------
-- ID: 11261
-- Item: Cirque Scarpe +1
-- Item Effect: Automation INT +10 MND +10
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_FEET) == 11261) then
		pet:addMod(MOD_INT, 10);
		pet:addMod(MOD_MND, 10);
	else
		pet:delMod(MOD_INT, 10);
		pet:delMod(MOD_MND, 10);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

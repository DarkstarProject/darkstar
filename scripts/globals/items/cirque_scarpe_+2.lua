-----------------------------------------
-- ID: 11161
-- Item: Cirque Scarpe +2
-- Item Effect: Automation INT +13 MND +13
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_FEET) == 11161) then
		pet:addMod(MOD_INT, 13);
		pet:addMod(MOD_MND, 13);
	else
		pet:delMod(MOD_INT, 13);
		pet:delMod(MOD_MND, 13);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

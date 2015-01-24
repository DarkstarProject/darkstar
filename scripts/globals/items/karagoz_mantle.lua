-----------------------------------------
-- ID: 11571
-- Item: Karagoz Mantle
-- Item Effect: Automation: Accuracy +12
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_BACK) == 11571) then
		pet:addMod(MOD_ACC, 12);
	else
		pet:delMod(MOD_ACC, 12);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

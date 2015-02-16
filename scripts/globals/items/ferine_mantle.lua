-----------------------------------------
-- ID: 11555
-- Item: Ferine Mantle
-- Item Effect: Pet: Accuracy +10
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_BACK) == 11555) then
		pet:addMod(MOD_ACC, 10);
	else
		pet:delMod(MOD_ACC, 10);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

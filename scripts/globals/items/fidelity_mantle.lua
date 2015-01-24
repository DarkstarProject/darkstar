-----------------------------------------
-- ID: 11531
-- Item: Fidelity Mantle
-- Item Effect: Pet Store TP +3
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_BACK) == 11531) then
		pet:addMod(MOD_STORETP, 3);
	else
		pet:delMod(MOD_STORETP, 3);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

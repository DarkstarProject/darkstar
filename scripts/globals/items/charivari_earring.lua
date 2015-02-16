-----------------------------------------
-- ID: 10296
-- Item: Charivari Earring
-- Item Effect: Pet Acc Racc and Macc +3
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_EAR1) == 10296 or target:getEquipID(SLOT_EAR2) == 10296) then
		pet:addMod(MOD_ACC, 3);
		pet:addMod(MOD_RACC, 3);
		pet:addMod(MOD_MACC, 3);
	else
		pet:delMod(MOD_ACC, 3);
		pet:delMod(MOD_RACC, 3);
		pet:delMod(MOD_MACC, 3);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

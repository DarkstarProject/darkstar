-----------------------------------------
-- ID: 11711
-- Item: Ferine Earring
-- Item Effect: Pet Accuracy +3
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_EAR1) == 11711 or target:getEquipID(SLOT_EAR2) == 11711) then
		pet:addMod(MOD_ACC, 3);
	else
		pet:addMod(MOD_ACC, 3);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

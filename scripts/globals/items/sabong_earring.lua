-----------------------------------------
-- ID: 10299
-- Item: Sabopng Earring
-- Item Effect: Pet Dbl Attack + 2%
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_EAR1) == 10299 or target:getEquipID(SLOT_EAR2) == 10299) then
		pet:addMod(MOD_DOUBLE_ATTACK, 2);
	else
		pet:delMod(MOD_DOUBLE_ATTACK, 2);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

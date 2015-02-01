-----------------------------------------
-- ID: 15833
-- Item: Diverters Ring
-- Item Effect: Avatar Enmity +2
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_RING1) == 15833 or target:getEquipID(SLOT_RING2) == 15833) then
		pet:addMod(MOD_ENMITY, 2);
	else
		pet:delMod(MOD_ENMITY, 2);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

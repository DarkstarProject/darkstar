-----------------------------------------
-- ID: 13975
-- Item: Evoker's Bracers
-- Item Effect: Avatar Enmity -2
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_HANDS) == 13975) then
		if(pet:getPetType() == PETTYPE_AVATAR) then
			pet:addMod(MOD_ENMITY, -2);
		else
			pet:delMod(MOD_ENMITY, -2);
		end
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

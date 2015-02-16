-----------------------------------------
-- ID: 14904
-- Item: Evoker's Bracers +1
-- Item Effect: Avatar Enmity -2
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_HANDS) == 14904) then
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

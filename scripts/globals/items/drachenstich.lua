-----------------------------------------
-- ID: 19792
-- Item: Drachenstich
-- Item Effect: Wyvern Dmg -5%
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_MAIN) == 19792) then
		if(pet:getPetType() == PETTYPE_WYVERN) then
			pet:addMod(MOD_DMG, -5);
		else
			pet:delMod(MOD_DMG, -5);
		end
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

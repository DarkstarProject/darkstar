-----------------------------------------
-- ID: 10743
-- Item: Wyrm Greaves +2
-- Item Effect: Wyvern HP +10%
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_FEET) == 10743) then
		if(pet:getPetType() == PETTYPE_WYVERN) then
			pet:addMod(MOD_HPP, 10);
		else
			pet:delMod(MOD_HPP, 10);
		end
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

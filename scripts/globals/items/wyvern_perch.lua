-----------------------------------------
-- ID: 17579
-- Item: Wyvern Perch
-- Item Effect: Wyvern HP +50
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_MAIN) == 17579) then
		if(pet:getPetType() == PETTYPE_WYVERN) then
			pet:addMod(MOD_HP, 50);
		else
			pet:delMod(MOD_HP, 50);
		end
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

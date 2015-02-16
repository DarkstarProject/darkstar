-----------------------------------------
-- ID: 14872
-- Item: Ostreger Mitts
-- Item Effect: Wyvern HP +10
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_HANDS) == 14872) then
		if(pet:getPetType() == PETTYPE_WYVERN) then
			pet:addMod(MOD_HP, 10);
		else
			pet:delMod(MOD_HP, 10);
		end
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

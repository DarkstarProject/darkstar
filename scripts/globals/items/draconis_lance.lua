-----------------------------------------
-- ID: 16843
-- Item: Draconis Lance
-- Item Effect: Wyvern Acc Atk
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_MAIN) == 16843) then
		if(pet:getPetType() == PETTYPE_WYVERN) then
			pet:addMod(MOD_ATT, 10);
			pet:addMod(MOD_ACC, 10);
		else
			pet:delMod(MOD_ATT, 10);
			pet:delMod(MOD_ACC, 10);
		end
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

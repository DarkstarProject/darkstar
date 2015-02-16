-----------------------------------------
-- ID: 15145
-- Item: Wyrm Greaves
-- Item Effect: Wyvern HP while healing +6
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_FEET) == 15145) then
		if(pet:getPetType() == PETTYPE_WYVERN) then
			pet:addMod(MOD_HPHEAL, 6);
		else
			pet:delMod(MOD_HPHEAL, 6);
		end
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

-----------------------------------------
-- ID: 15678
-- Item: Wyrm Greaves +1
-- Item Effect: Wyvern HP while healing +7
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (pet:getEquipID(SLOT_FEET) == 15678) then
		if(target:getPetType() == PETTYPE_WYVERN) then
			pet:addMod(MOD_HPHEAL, 7);
		else
			pet:delMod(MOD_HPHEAL, 7);
		end
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

-----------------------------------------
-- ID: 27929
-- Item: Skadi's Bazubands +1
-- Item Effect: Pet Haste
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_HANDS) == 27929) then
		pet:addMod(MOD_HASTE_GEAR, 31);
	else
		pet:delMod(MOD_HASTE_GEAR, 31);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

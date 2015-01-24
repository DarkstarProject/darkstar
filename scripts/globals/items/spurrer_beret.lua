-----------------------------------------
-- ID: 11497
-- Item: Spurrer Beret
-- Item Effect: Pet Haste +5%
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_HEAD) == 11497) then
		pet:addMod(MOD_HASTE_GEAR, 51);
	else
		pet:delMod(MOD_HASTE_GEAR, 51);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

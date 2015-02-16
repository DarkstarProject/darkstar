-----------------------------------------
-- ID: 10915
-- Item: Muzzling Collar +1
-- Item Effect: Pet Enmity -3
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_NECK) == 10915) then
		pet:addMod(MOD_ENMITY, -3);
	else
		pet:delMod(MOD_ENMITY, -3);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

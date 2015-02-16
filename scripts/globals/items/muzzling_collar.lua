-----------------------------------------
-- ID: 10914
-- Item: Muzzling Collar
-- Item Effect: Pet Enmity -2
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_NECK) == 10914) then
		pet:addMod(MOD_ENMITY, -2);
	else
		pet:delMod(MOD_ENMITY, -2);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

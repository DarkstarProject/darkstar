-----------------------------------------
-- ID: 11987
-- Item: Ngen Seraweels
-- Item Effect: Avatar Regen
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_NECK) == 11987) then
		pet:addMod(MOD_REGEN, 3);
	else
		pet:delMod(MOD_REGEN, 3);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

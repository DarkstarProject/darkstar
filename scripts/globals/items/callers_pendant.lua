-----------------------------------------
-- ID: 11619
-- Item: Callers Pendant
-- Item Effect: Pet Regain
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_NECK) == 11619) then
		pet:addMod(MOD_REGAIN, 3);
	else
		pet:delMod(MOD_REGAIN, 3);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

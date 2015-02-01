-----------------------------------------
-- ID: 15146
-- Item: Summoner's Pigaches
-- Item Effect: Avatar: Atk +2
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_FEET) == 15146) then
		pet:addMod(MOD_ATT, 2);
	else
		pet:delMod(MOD_ATT, 2);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

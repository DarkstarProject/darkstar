-----------------------------------------
-- ID: 10744
-- Item: Summoner's Pigaches +2
-- Item Effect: Avatar: Atk +2
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_FEET) == 10744) then
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

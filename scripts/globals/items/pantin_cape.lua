-----------------------------------------
-- ID: 16245
-- Item: Pantin Cape
-- Item Effect: Automation: Attack +15
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_BACK) == 16245) then
		pet:addMod(MOD_ATT, 15);
	else
		pet:delMod(MOD_ATT, 15);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

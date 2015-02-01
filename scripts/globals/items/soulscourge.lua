-----------------------------------------
-- ID: 17105
-- Item: Soulscourge
-- Item Effect: Enhances Avatar Attack +10
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_MAIN) == 17105 or target:getEquipID(SLOT_SUB) == 17105) then
		pet:addMod(MOD_ATT, 10);
	else
		pet:delMod(MOD_ATT, 10);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

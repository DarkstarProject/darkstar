-----------------------------------------
-- ID: 15661
-- Item: Homam Gambieras
-- Item Effect: Wyvern HP +50
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_FEET) == 15661) then
		pet:addMod(MOD_HP, 50);
	else
		pet:delMod(MOD_HP, 50);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

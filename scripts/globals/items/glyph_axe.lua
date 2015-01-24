-----------------------------------------
-- ID: 16654
-- Item: Glyph Axe
-- Item Effect: Pet Regain
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_MAIN) == 16654 or target:getEquipID(SLOT_SUB) == 16654) then
		pet:addMod(MOD_REGAIN, 1);
	else
		pet:delMod(MOD_REGAIN, 1);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

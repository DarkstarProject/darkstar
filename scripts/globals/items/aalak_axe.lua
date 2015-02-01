-----------------------------------------
-- ID: 20831
-- Item: Aalak Axe
-- Item Effect: Pet Dbl Atk +2%
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_MAIN) == 20831 or target:getEquipID(SLOT_SUB) == 20831) then
		pet:addMod(MOD_DOUBLE_ATTACK, 2);
	else
		pet:delMod(MOD_DOUBLE_ATTACK, 2);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

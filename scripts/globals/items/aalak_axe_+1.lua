-----------------------------------------
-- ID: 20832
-- Item: Aalak Axe +1
-- Item Effect: Pet Dbl Atk +3%
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_MAIN) == 20832 or target:getEquipID(SLOT_SUB) == 20832) then
		pet:addMod(MOD_DOUBLE_ATTACK, 3);
	else
		pet:delMod(MOD_DOUBLE_ATTACK, 3);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

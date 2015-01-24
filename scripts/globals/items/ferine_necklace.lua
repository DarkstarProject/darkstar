-----------------------------------------
-- ID: 11617
-- Item: Ferine Necklace
-- Item Effect: Pet Double Attack +2%
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_NECK) == 11617) then
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

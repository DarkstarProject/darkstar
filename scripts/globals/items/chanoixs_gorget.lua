-----------------------------------------
-- ID: 16270
-- Item: Chanoixs Gorget
-- Item Effect: Pet HP +50
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_NECK) == 16270) then
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

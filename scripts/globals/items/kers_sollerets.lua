-----------------------------------------
-- ID: 28213
-- Item: Ker's Sollerets
-- Item Effect: Wyvern ATK +13
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_FEET) == 28213) then
		pet:addMod(MOD_ATT, 13);
	else
		pet:delMod(MOD_ATT, 13);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

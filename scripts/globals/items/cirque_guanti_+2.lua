-----------------------------------------
-- ID: 11121
-- Item: Cirque Guanti +2
-- Item Effect: Automation Str +13 Dex +13 Agi +13
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_HANDS) == 11121) then
		pet:addMod(MOD_STR, 13);
		pet:addMod(MOD_DEX, 13);
		pet:addMod(MOD_AGI, 13);
	else
		pet:delMod(MOD_STR, 13);
		pet:delMod(MOD_DEX, 13);
		pet:delMod(MOD_AGI, 13);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

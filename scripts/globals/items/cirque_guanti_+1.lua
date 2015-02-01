-----------------------------------------
-- ID: 11221
-- Item: Cirque Guanti +1
-- Item Effect: Automation Str +10 Dex +10 Agi +10
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_HANDS) == 11221) then
		pet:addMod(MOD_STR, 10);
		pet:addMod(MOD_DEX, 10);
		pet:addMod(MOD_AGI, 10);
	else
		pet:delMod(MOD_STR, 10);
		pet:delMod(MOD_DEX, 10);
		pet:delMod(MOD_AGI, 10);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

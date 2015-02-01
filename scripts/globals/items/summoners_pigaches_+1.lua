-----------------------------------------
-- ID: 15679
-- Item: Summoner's Pigaches +1
-- Item Effect: Avatar: Enmity +2 Atk +2
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_FEET) == 15679) then
		pet:addMod(MOD_ENMITY, 2);
		pet:addMod(MOD_ATT, 2);
	else
		pet:delMod(MOD_ENMITY, 2);
		pet:delMod(MOD_ATT, 2);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

-----------------------------------------
-- ID: 15594
-- Item: Summoner's Spats +1
-- Item Effect: Avatar Enmity +2
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_LEGS) == 15594) then
		pet:addMod(MOD_ENMITY, 2);
	else
		pet:delMod(MOD_ENMITY, 2);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

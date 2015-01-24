-----------------------------------------
-- ID: 15101
-- Item: Summoner Doublet
-- Item Effect: Avatar: Crit Hit Rate +3%
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_BODY) == 15101) then
		pet:addMod(MOD_CRITHITRATE, 3);
	else
		pet:delMod(MOD_CRITHITRATE, 3);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

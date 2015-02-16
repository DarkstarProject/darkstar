-----------------------------------------
-- ID: 14514
-- Item: Summoner Doublet +1
-- Item Effect: Avatar: Crit Hit Rate +4%
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_BODY) == 14514) then
		pet:addMod(MOD_CRITHITRATE, 4);
	else
		pet:delMod(MOD_CRITHITRATE, 4);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

-----------------------------------------
-- ID: 10667
-- Item: Pantin Taj +2
-- Item Effect: Automation: Regen and Refresh
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_HEAD) == 10667) then
		pet:addMod(EFFECT_REGEN,2,1,0);
		pet:addMod(EFFECT_REFRESH,2,1,0);
	else
		pet:delMod(EFFECT_REGEN,2,1,0);
		pet:delMod(EFFECT_REFRESH,2,1,0);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

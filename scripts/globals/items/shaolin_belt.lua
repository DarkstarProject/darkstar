-----------------------------------------
-- ID: 11734
-- Item: Shaolin Belt
-- Item Effect: Automation: Haste +3%
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_WAIST) == 11734) then
		pet:addMod(MOD_HASTE_GEAR, 31);
	else
		pet:delMod(MOD_HASTE_GEAR, 31);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

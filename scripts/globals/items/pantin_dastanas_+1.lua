-----------------------------------------
-- ID: 15032
-- Item: Pantin Dastanas +1
-- Item Effect: Automation Haste +3%
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_HANDS) == 15032) then
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

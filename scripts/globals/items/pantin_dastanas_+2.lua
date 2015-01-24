-----------------------------------------
-- ID: 10707
-- Item: Pantin Dastanas +2
-- Item Effect: Automation Haste +4% Subtle Blow +5
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_HANDS) == 10707) then
		pet:addMod(MOD_HASTE_GEAR, 41);
		pet:addMod(MOD_SUBTLE_BLOW, 5);
	else
		pet:delMod(MOD_HASTE_GEAR, 41);
		pet:delMod(MOD_SUBTLE_BLOW, 5);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

-----------------------------------------
-- ID: 28211
-- Item: Marduk's Crackows +1
-- Item Effect: Avatar ATK +3 Haste +2%
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_FEET) == 28211) then
		pet:addMod(MOD_ATT, 2);
		pet:addMod(MOD_HASTE_GEAR, 20);
	else
		pet:delMod(MOD_ATT, 2);
		pet:delMod(MOD_HASTE_GEAR, 20);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

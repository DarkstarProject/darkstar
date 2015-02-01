-----------------------------------------
-- ID: 11038
-- Item: Dragonkin Earring
-- Item Effect: Pet Wyvern Physical Dmg taken -2%
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_EAR1) == 11038 or target:getEquipID(SLOT_EAR2) == 11038) then
		pet:addMod(MOD_DMGPHYS, -2);
	else
		pet:addMod(MOD_DMGPHYS, -2);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

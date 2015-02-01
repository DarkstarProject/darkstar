-----------------------------------------
-- ID: 15593
-- Item: Wyrm Brais +1
-- Item Effect: Wyvern Physical Dmg -6%
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_LEGS) == 15593) then
		if(pet:getPetType() == PETTYPE_WYVERN) then
			pet:addMod(MOD_DMGPHYS, -6);
		else
			pet:delMod(MOD_DMGPHYS, -6);
		end
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

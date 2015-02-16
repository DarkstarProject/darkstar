-----------------------------------------
-- ID: 10723
-- Item: Wyrm Brais +2
-- Item Effect: Wyvern Physical Dmg -7%
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_LEGS) == 10723) then
		if(pet:getPetType() == PETTYPE_WYVERN) then
			pet:addMod(MOD_DMGPHYS, -7);
		else
			pet:delMod(MOD_DMGPHYS, -7);
		end
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

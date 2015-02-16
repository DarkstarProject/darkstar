-----------------------------------------
-- ID: 15130
-- Item: Wyrm Brais
-- Item Effect: Wyvern Physical Dmg -5%
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_LEGS) == 15130) then
		if(pet:getPetType() == PETTYPE_WYVERN) then
			pet:addMod(MOD_DMGPHYS, -5);
		else
			pet:delMod(MOD_DMGPHYS, -5);
		end
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

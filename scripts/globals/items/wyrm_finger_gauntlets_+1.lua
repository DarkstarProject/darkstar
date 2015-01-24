-----------------------------------------
-- ID: 14922
-- Item: Wyrm Finger Gauntlets +1
-- Item Effect: Wyvern Magic Dmg -5%
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_HANDS) == 14922) then
		if(pet:getPetType() == PETTYPE_WYVERN) then
			pet:addMod(MOD_DMGMAGIC, 13);
		else
			pet:delMod(MOD_DMGMAGIC, 13);
		end
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

-----------------------------------------
-- ID: 10703
-- Item: Wyrm Finger Gauntlets +2
-- Item Effect: Wyvern Magic Dmg -7%
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_HANDS) == 10703) then
		if(pet:getPetType() == PETTYPE_WYVERN) then
			pet:addMod(MOD_DMGMAGIC, 18);
		else
			pet:delMod(MOD_DMGMAGIC, 18);
		end
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

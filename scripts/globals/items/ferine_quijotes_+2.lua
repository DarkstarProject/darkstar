-----------------------------------------
-- ID: 11132
-- Item: Ferine Quijotes +2
-- Item Effect: Pet -2% Dmg
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_LEGS) == 11132) then
		pet:addMod(MOD_DMG, -2);
	else
		pet:delMod(MOD_DMG, -2);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

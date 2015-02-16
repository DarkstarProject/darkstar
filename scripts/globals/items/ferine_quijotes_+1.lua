-----------------------------------------
-- ID: 11232
-- Item: Ferine Quijotes +1
-- Item Effect: Pet -1% Dmg
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_LEGS) == 11232) then
		pet:addMod(MOD_DMG, -1);
	else
		pet:delMod(MOD_DMG, -1);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

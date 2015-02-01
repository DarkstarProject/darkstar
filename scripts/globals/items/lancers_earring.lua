-----------------------------------------
-- ID: 11716
-- Item: Lancer's Earring
-- Item Effect: Pet HP +20
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_EAR1) == 11716 or target:getEquipID(SLOT_EAR2) == 11716) then
		pet:addMod(MOD_HP, 20);
	else
		pet:addMod(MOD_HP, 20);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

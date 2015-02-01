-----------------------------------------
-- ID: 11720
-- Item: Cirque Earring
-- Item Effect: Automation Atk +2 RAtk +2 MAB+2
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_EAR1) == 11720 or target:getEquipID(SLOT_EAR2) == 11720) then
		pet:addMod(MOD_ATT, 2);
		pet:addMod(MOD_RATT, 2);
		pet:addMod(MOD_MATT, 2);
	else
		pet:delMod(MOD_ATT, 2);
		pet:delMod(MOD_RATT, 2);
		pet:delMod(MOD_MATT, 2);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

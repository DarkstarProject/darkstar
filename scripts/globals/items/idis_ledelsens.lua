-----------------------------------------
--	ID: 28219
--	Item: Idi's Ledelsend
--	Effect: Wyvern Evasion +2
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_FEET) == 28219) then
		pet:addMod(MOD_EVA, 2);
	else
		pet:delMod(MOD_EVA, 2);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

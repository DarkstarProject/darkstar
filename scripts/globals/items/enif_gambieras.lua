-----------------------------------------
-- ID: 10367
-- Item: Enif Gambieras
-- Item Effect: Wyvern HP +80
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_FEET) == 10367) then
		pet:addMod(MOD_HP, 80);
	else
		pet:delMod(MOD_HP, 80);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

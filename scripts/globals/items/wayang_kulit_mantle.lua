-----------------------------------------
-- ID: 11536
-- Item: Wayang Kuilt Mantle
-- Item Effect: Automation: Melee skill +2
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_BACK) == 11536) then
		pet:addMod(MOD_HTH, 2);
	else
		pet:delMod(MOD_HTH, 2);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

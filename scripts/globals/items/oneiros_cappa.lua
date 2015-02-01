-----------------------------------------
-- ID: 10972
-- Item: Oneiros Cappa
-- Item Effect: Pet Physical Dmg taken -3%
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_BACK) == 10972) then
		pet:addMod(MOD_DMGPHYS, -3);
	else
		pet:delMod(MOD_DMGPHYS, -3);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

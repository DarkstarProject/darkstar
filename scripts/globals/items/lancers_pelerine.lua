-----------------------------------------
-- ID: 16208
-- Item: Lancer's Pelerine
-- Item Effect: Pet HP +30
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_BACK) == 16208) then
		pet:addMod(MOD_HP,30);
	else
		pet:delMod(MOD_HP,30);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

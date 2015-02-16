-----------------------------------------
-- ID: 11241
-- Item: Cirque Pantaloni +1
-- Item Effect: Automation Combat Skill +5
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_LEGS) == 11241) then
		pet:addMod(MOD_HTH, 5);
		pet:addMod(MOD_ARCHERY, 5);
		pet:addMod(MOD_MARKSMAN, 5);
		pet:addMod(MOD_ELEM, 5);
	else
		pet:delMod(MOD_HTH, 5);
		pet:delMod(MOD_ARCHERY, 5);
		pet:delMod(MOD_MARKSMAN, 5);
		pet:delMod(MOD_ELEM, 5);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

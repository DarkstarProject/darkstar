-----------------------------------------
-- ID: 11141
-- Item: Cirque Pantaloni +2
-- Item Effect: Automation Combat Skill +10
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_LEGS) == 11141) then
		pet:addMod(MOD_HTH, 10);
		pet:addMod(MOD_ARCHERY, 10);
		pet:addMod(MOD_MARKSMAN, 10);
		pet:addMod(MOD_ELEM, 10);
	else
		pet:delMod(MOD_HTH, 10);
		pet:delMod(MOD_ARCHERY, 10);
		pet:delMod(MOD_MARKSMAN, 10);
		pet:delMod(MOD_ELEM, 10);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

-----------------------------------------
-- ID: 15910
-- Item: Primal Belt
-- Item Effect: Pet gets DEF +5 Enimity +3
-----------------------------------------

require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_WAIST) == 15910) then
		pet:addMod(MOD_DEF, 5);
		pet:addMod(MOD_ENMITY, 3);
	else
		pet:delMod(MOD_DEF, 5);
		pet:delMod(MOD_ENMITY, 3);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

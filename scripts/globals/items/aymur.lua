-----------------------------------------
-- ID: 18999 - 19086 - 19088 - 19620 - 19718 - 19827 - 19956
-- Item: Aymur
-- Item Effect: Pet Attack Bonus
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	// Aymur Lvl 75 - 2
	if (target:getEquipID(SLOT_MAIN) == 18999 or target:getEquipID(SLOT_SUB) == 18999) then
		pet:addMod(MOD_ATT, 10);
	else
		pet:delMod(MOD_ATT, 10);
	end
	// Aymur Lvl 80
	if (target:getEquipID(SLOT_MAIN) == 19068 or target:getEquipID(SLOT_SUB) == 19068) then
		pet:addMod(MOD_ATT, 22);
	else
		pet:delMod(MOD_ATT, 22);
	end
	// Aymur Lvl 85
	if (target:getEquipID(SLOT_MAIN) == 19088 or target:getEquipID(SLOT_SUB) == 19088) then
		pet:addMod(MOD_ATT, 35);
	else
		pet:delMod(MOD_ATT, 35);
	end
	// Aymur Lvl 90
	if (target:getEquipID(SLOT_MAIN) == 19620 or target:getEquipID(SLOT_SUB) == 19620) then
		pet:addMod(MOD_ATT, 48);
	else
		pet:delMod(MOD_ATT, 48);
	end
	// Aymur Lvl 95
	if (target:getEquipID(SLOT_MAIN) == 19718 or target:getEquipID(SLOT_SUB) == 19718) then
		pet:addMod(MOD_ATT, 48);
	else
		pet:delMod(MOD_ATT, 48);
	end
	// Aymur Lvl 99
	if (target:getEquipID(SLOT_MAIN) == 19827 or target:getEquipID(SLOT_SUB) == 19827) then
		pet:addMod(MOD_ATT, 60);
	else
		pet:delMod(MOD_ATT, 60);
	end
	// Aymur Lvl 99 - 2
	if (target:getEquipID(SLOT_MAIN) == 19956 or target:getEquipID(SLOT_SUB) == 19956) then
		pet:addMod(MOD_ATT, 60);
	else
		pet:delMod(MOD_ATT, 60);
	end
	
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

-----------------------------------------
-- ID: 28078
-- Item: Omodaka Hizayoroi
-- Item Effect: Automation STR +6 DEX +6 AGI +6 Haste +4%
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local pet = target:getPet();
	
	if (target:getEquipID(SLOT_LEGS) == 28078) then
		pet:addMod(MOD_STR, 6);
		pet:addMod(MOD_DEX, 6);
		pet:addMod(MOD_AGI, 6);
		pet:addMod(MOD_HASTE_GEAR, 61);
	else
		pet:delMod(MOD_STR, 6);
		pet:delMod(MOD_DEX, 6);
		pet:delMod(MOD_AGI, 6);
		pet:delMod(MOD_HASTE_GEAR, 61);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

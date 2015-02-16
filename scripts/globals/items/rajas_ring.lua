-----------------------------------------
-- ID: 15543
-- Item: Rajas Ring
-- Item Effect: STR +2~5 DEX +2~5 Variable with Lvl
-- DEF +1 every 10 Lvls
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local lvl = target:getMainLvl();
	local attribMod = 0
	if (target:getEquipID(SLOT_BACK) == 13680) then
		if(lvl >= 45) then
			attribMod = attribMod + 1
		end
		if(lvl >= 60) then
			attribMod = attribMod + 1
		end
		if(lvl >= 75) then
			attribMod = attribMod + 1
		end
		target:addMod(MOD_STR, attribMod);
		target:addMod(MOD_DEX, attribMod);
	else
		target:delMod(MOD_STR, attribMod);
		target:delMod(MOD_DEX, attribMod);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

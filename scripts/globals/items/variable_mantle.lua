-----------------------------------------
-- ID: 13680
-- Item: Variable Mantle
-- Item Effect: Variable DEF with Lvl
-- DEF +1 every 10 Lvls
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local lvl = target:getMainLvl();
	local defMod = 0
	if (target:getEquipID(SLOT_BACK) == 13680) then
		if(lvl >= 30) then
			defMod = defMod + 1
		end
		if(lvl >= 40) then
			defMod = defMod + 1
		end
		if(lvl >= 50) then
			defMod = defMod + 1
		end
		if(lvl >= 60) then
			defMod = defMod + 1
		end
		if(lvl >= 70) then
			defMod = defMod + 1
		end
		if(lvl >= 80) then
			defMod = defMod + 1
		end
		if(lvl >= 90) then
			defMod = defMod + 1
		end
		target:addMod(MOD_DEF, defMod);
	else
		target:delMod(MOD_DEF, defMod);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

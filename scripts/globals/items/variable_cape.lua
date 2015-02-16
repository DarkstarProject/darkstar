-----------------------------------------
-- ID: 13681
-- Item: Variable Cape
-- Item Effect: Variable DEF and MP with Lvl
-- DEF +1 every 10 Lvls MP +2 every 5 Lvls
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local lvl = target:getMainLvl();
	local defMod = 0
	local mpMod = 0
	if (target:getEquipID(SLOT_BACK) == 13681) then
		if(lvl >= 25) then
			mpMod = mpMod + 2
		end
		if(lvl >= 30) then
			defMod = defMod + 1
			mpMod = mpMod + 2
		end
		if(lvl >= 35) then
			mpMod = mpMod + 2
		end
		if(lvl >= 40) then
			defMod = defMod + 1
			mpMod = mpMod + 2
		end
		if(lvl >= 45) then
			mpMod = mpMod + 2
		end
		if(lvl >= 50) then
			defMod = defMod + 1
			mpMod = mpMod + 2
		end
		if(lvl >= 55) then
			mpMod = mpMod + 2
		end
		if(lvl >= 60) then
			defMod = defMod + 1
			mpMod = mpMod + 2
		end
		if(lvl >= 65) then
			mpMod = mpMod + 2
		end
		if(lvl >= 70) then
			defMod = defMod + 1
			mpMod = mpMod + 2
		end
		if(lvl >= 75) then
			mpMod = mpMod + 2
		end
		if(lvl >= 80) then
			defMod = defMod + 1
			mpMod = mpMod + 2
		end
		if(lvl >= 85) then
			mpMod = mpMod + 2
		end
		if(lvl >= 90) then
			defMod = defMod + 1
			mpMod = mpMod + 2
		end
		if(lvl >= 95) then
			mpMod = mpMod + 2
		end
		target:addMod(MOD_DEF, defMod);
		target:addMod(MOD_MP, mpMod);
	else
		target:delMod(MOD_DEF, defMod);
		target:delMod(MOD_MP, mpMod);
	end
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
end;

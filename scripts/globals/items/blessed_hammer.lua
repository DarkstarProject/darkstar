-----------------------------------------
-- ID: 17422
-- Equip: Blessed Hammer
-- DMG: 27 Delay: 324 MP +10 MND +2
-- Lv. 41 WHM
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target,prevzone)

	mainW = target:getEquipID(1); -- Main Weapon
	subW = target:getEquipID(2); -- Sub Weapon
	
	if(mainW == 17422 or subW = 17422) then
		target:addMod(MOD_MP,10);
		target:addMod(MOD_MND,2);
	else
		target:delMod(MOD_MP,10);
		target:delMod(MOD_MND,2);
	end
	
end;
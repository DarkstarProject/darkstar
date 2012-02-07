-----------------------------------------
-- ID: 17423
-- Equip: Casting Wand
-- DMG: 12 Delay: 216 MP +20
-- Lv. 41 BLM
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target,prevzone)

	mainW = target:getEquipID(1); -- Main Weapon
	subW = target:getEquipID(2); -- Sub Weapon
	
	if(mainW == 17423 or subW = 17423) then
		target:addMod(MOD_MP,20);
	else
		target:delMod(MOD_MP,20);
	end
	
end;
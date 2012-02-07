-----------------------------------------
-- ID: 14216
-- Equip: Healer's Pantaloons
-- DEF: 28 MP +15 VIT +3
-- Divine magic skill +15
-- Enmity -1
-- Lv. 56 WHM 
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target,prevzone)

	legs = target:getEquipID(8); -- Legs
	
	if(legs == 14216) then
		target:addMod(MOD_DEF,28);
		target:addMod(MOD_MP,15);
		target:addMod(MOD_VIT,3);
		target:addMod(MOD_DIVINE,15);
		target:addMod(MOD_ENMITY,-1);
	else
		target:delMod(MOD_DEF,28);
		target:delMod(MOD_MP,15);
		target:delMod(MOD_VIT,3);
		target:delMod(MOD_DIVINE,15);
		target:delMod(MOD_ENMITY,-1);
	end
	
end;
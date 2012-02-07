-----------------------------------------
-- ID: 13855
-- Equip: Healer's Cap
-- DEF: 21 MP +13 MND +4 Resist Vs. Dark +15 Enmity -1
-- Lv. 54 WHM
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target,prevzone)

	head = target:getEquipID(5); -- Head
	
	if(head == 13855) then
		target:addMod(MOD_DEF,21);
		target:addMod(MOD_MP,13);
		target:addMod(MOD_MND,4);
		target:addMod(MOD_DARKDEF,15);
		target:addMod(MOD_ENMITY,-1);
	else
		target:delMod(MOD_DEF,21);
		target:delMod(MOD_MP,13);
		target:delMod(MOD_MND,4);
		target:delMod(MOD_DARKDEF,15);
		target:delMod(MOD_ENMITY,-1);
	end
	
end;
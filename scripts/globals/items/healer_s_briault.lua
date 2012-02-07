-----------------------------------------
-- ID: 12640
-- Equip: Healer's Briault
-- DEF: 40 MP +15 Resist Vs. Wind +10
-- Enfeebling magic skill +10 Enmity -4
-- Lv. 58 WHM 
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target,prevzone)

	body = target:getEquipID(6); -- Body
	
	if(body == 12640) then
		target:addMod(MOD_DEF,40);
		target:addMod(MOD_MP,15);
		target:addMod(MOD_WINDDEF,10);
		target:addMod(MOD_ENFEEBLE,10);
		target:addMod(MOD_ENMITY,-4);
	else
		target:delMod(MOD_DEF,40);
		target:delMod(MOD_MP,15);
		target:delMod(MOD_WINDDEF,10);
		target:delMod(MOD_ENFEEBLE,10);
		target:delMod(MOD_ENMITY,-4);
	end
	
end;
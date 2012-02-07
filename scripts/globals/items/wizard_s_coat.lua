-----------------------------------------
-- ID: 12641
-- Equip: Wizard's Coat
-- DEF: 38 MP +16 VIT +5
-- Enfeebling magic skill +10 Enmity -3
-- Lv. 58 BLM 
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target,prevzone)

	body = target:getEquipID(6); -- Body
	
	if(body == 12641) then
		target:addMod(MOD_DEF,38);
		target:addMod(MOD_MP,16);
		target:addMod(MOD_VIT,5);
		target:addMod(MOD_ENFEEBLE,10);
		target:addMod(MOD_ENMITY,-3);
	else
		target:delMod(MOD_DEF,38);
		target:delMod(MOD_MP,16);
		target:delMod(MOD_VIT,5);
		target:delMod(MOD_ENFEEBLE,10);
		target:delMod(MOD_ENMITY,-3);
	end
	
end;
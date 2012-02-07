-----------------------------------------
-- ID: 13963
-- Equip: Healer's Mitts
-- DEF: 14 MP +10 STR +5
-- Healing magic skill +15 Enmity -4
-- Lv. 60 WHM 
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target,prevzone)

	hands = target:getEquipID(7); -- Hands
	
	if(hands == 13963) then
		target:addMod(MOD_DEF,14);
		target:addMod(MOD_MP,10);
		target:addMod(MOD_STR,5);
		target:addMod(MOD_HEALING,15);
		target:addMod(MOD_ENMITY,-4);
	else
		target:delMod(MOD_DEF,14);
		target:delMod(MOD_MP,10);
		target:delMod(MOD_STR,5);
		target:delMod(MOD_HEALING,15);
		target:delMod(MOD_ENMITY,-4);
	end
	
end;
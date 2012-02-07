-----------------------------------------
-- ID: 13964
-- Equip: Wizard's Gloves
-- DEF: 13 MP +12 CHR +3
-- Elemental magic skill +15 Enmity -1
-- Lv. 54 BLM 
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target,prevzone)

	hands = target:getEquipID(7); -- Hands
	
	if(hands == 13964) then
		target:addMod(MOD_DEF,13);
		target:addMod(MOD_MP,12);
		target:addMod(MOD_CHR,3);
		target:addMod(MOD_ELEM,15);
		target:addMod(MOD_ENMITY,-1);
	else
		target:delMod(MOD_DEF,13);
		target:delMod(MOD_MP,12);
		target:delMod(MOD_CHR,3);
		target:delMod(MOD_ELEM,15);
		target:delMod(MOD_ENMITY,-1);
	end
	
end;
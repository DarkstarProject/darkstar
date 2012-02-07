-----------------------------------------
-- ID: 14091
-- Equip: Healer's Duckbills
-- DEF: 12 MP +10 AGI +3
-- Spell interruption rate down 20%
-- Lv. 52 WHM 
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target,prevzone)

	feet = target:getEquipID(9); -- Feet
	
	if(feet == 14091) then
		target:addMod(MOD_DEF,12);
		target:addMod(MOD_MP,10);
		target:addMod(MOD_AGI,3);
		target:addMod(MOD_SPELLINTERRUPT,20);
	else
		target:delMod(MOD_DEF,12);
		target:delMod(MOD_MP,10);
		target:delMod(MOD_AGI,3);
		target:delMod(MOD_SPELLINTERRUPT,20);
	end
	
end;
-----------------------------------------
-- ID: 14092
-- Equip: Wizard's Sabots
-- DEF: 11 MP +10 AGI +3
-- Spell interruption rate down 20%
-- Enmity -1
-- Lv. 52 BLM  
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target,prevzone)

	feet = target:getEquipID(9); -- Feet
	
	if(feet == 14092) then
		target:addMod(MOD_DEF,11);
		target:addMod(MOD_MP,10);
		target:addMod(MOD_AGI,3);
		target:addMod(MOD_SPELLINTERRUPT,20);
		target:addMod(MOD_ENMITY,-1);
	else
		target:delMod(MOD_DEF,11);
		target:delMod(MOD_MP,10);
		target:delMod(MOD_AGI,3);
		target:delMod(MOD_SPELLINTERRUPT,20);
		target:delMod(MOD_ENMITY,-1);
	end
	
end;
-----------------------------------------
-- ID: 14217
-- Equip: Wizard's Tonban
-- DEF: 27 MP +14 Evasion +5
-- Dark magic skill +15
-- Enmity -1
-- Lv. 56 BLM 
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target,prevzone)

	legs = target:getEquipID(8); -- Legs
	
	if(legs == 14217) then
		target:addMod(MOD_DEF,27);
		target:addMod(MOD_MP,14);
		target:addMod(MOD_EVA,5);
		target:addMod(MOD_DARK,15);
		target:addMod(MOD_ENMITY,-1);
	else
		target:delMod(MOD_DEF,27);
		target:delMod(MOD_MP,14);
		target:delMod(MOD_EVA,5);
		target:delMod(MOD_DARK,15);
		target:delMod(MOD_ENMITY,-1);
	end
	
end;
-----------------------------------------
-- ID: 13856
-- Equip: Wizard's Petasos
-- DEF: 20 MP +25 INT +4 Resist Vs. Lightning +10 Enmity -4
-- Lv. 60 BLM
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target,prevzone)

	head = target:getEquipID(5); -- Head
	
	if(head == 13856) then
		target:addMod(MOD_DEF,20);
		target:addMod(MOD_MP,25);
		target:addMod(MOD_INT,4);
		target:addMod(MOD_THUNDERDEF,10);
		target:addMod(MOD_ENMITY,-4);
	else
		target:delMod(MOD_DEF,20);
		target:delMod(MOD_MP,25);
		target:delMod(MOD_INT,4);
		target:delMod(MOD_THUNDERDEF,10);
		target:delMod(MOD_ENMITY,-4);
	end
	
end;
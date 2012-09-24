-----------------------------------------
--	ID: 15851
--	Equip: Kusha's Ring
--  Set: DEF: +6 Accuracy +12 Attack +6
--	Set completed by Lavas Ring
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)

ring1 = target:getEquipID(SLOT_RING1);
ring2 = target:getEquipID(SLOT_RING2);

	if ((ring1 == 15851 and ring2 == 15850) or
		(ring1 == 15850 and ring2 == 15851)) then
		target:addMod(MOD_DEF, 6);
		target:addMod(MOD_ATT, 6);	
		target:addMod(MOD_ACC,12);
	elseif (ring1 == 15850 or ring2 == 15850) then
		target:delMod(MOD_DEF, 6);
		target:delMod(MOD_ATT, 6);
		target:delMod(MOD_ACC,12);
	end
end;
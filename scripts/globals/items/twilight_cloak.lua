-----------------------------------------
--	ID: 11363
--	Equip: Twilight Cloak
--	Able to cast "Impact"
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)

body = target:getEquipID(5);

	if (body == 11363) then
		target:addSpell(503);
	else
		target:delSpell(503);
	end
end;
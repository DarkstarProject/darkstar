-----------------------------------------
--	ID: 5102
--	Scroll of Foil
--	Teaches the white magic Foil
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(840);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(840);
end;
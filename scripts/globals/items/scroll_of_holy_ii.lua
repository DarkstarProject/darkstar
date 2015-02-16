-----------------------------------------
--	ID: 4630
--	Scroll of Holy
--	Teaches the white magic Holy
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(22);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(22);
end;
-----------------------------------------
--	ID: 4926
--	Scroll of Watera
--	Teaches the black magic Watera
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(838);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(838);
end;
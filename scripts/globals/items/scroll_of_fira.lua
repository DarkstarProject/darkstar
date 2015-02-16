-----------------------------------------
--	ID: 4916
--	Scroll of Fira
--	Teaches the black magic Fira
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(828);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(828);
end;
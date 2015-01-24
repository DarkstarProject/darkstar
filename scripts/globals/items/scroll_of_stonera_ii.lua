-----------------------------------------
--	ID: 4923
--	Scroll of Stonera II
--	Teaches the black magic Stonera II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(835);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(835);
end;
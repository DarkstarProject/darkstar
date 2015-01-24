-----------------------------------------
--	ID: 4927
--	Scroll of Watera II
--	Teaches the black magic Watera II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(839);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(839);
end;
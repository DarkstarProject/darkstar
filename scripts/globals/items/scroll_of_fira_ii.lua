-----------------------------------------
--	ID: 4917
--	Scroll of Fira II
--	Teaches the black magic Fira II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(829);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(829);
end;
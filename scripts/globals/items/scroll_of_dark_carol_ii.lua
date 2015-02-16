-----------------------------------------
--	ID: 5061
--	Scroll of Dark Carol II
--	Teaches the song Dark Carol II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(453);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(453);
end;
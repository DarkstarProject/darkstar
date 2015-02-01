-----------------------------------------
--	ID: 4918
--	Scroll of Blizzara
--	Teaches the black magic Blizzara
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(830);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(830);
end;
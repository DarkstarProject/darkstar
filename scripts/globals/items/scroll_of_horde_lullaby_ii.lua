-----------------------------------------
--	ID: 4985
--	Scroll of Horde Lullaby II
--	Teaches the song Horde Lullaby II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(377);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(377);
end;
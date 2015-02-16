-----------------------------------------
--	ID: 5060
--	Scroll of Light Carol II
--	Teaches the song Light Carol II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(452);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(452);
end;
-----------------------------------------
--	ID: 5055
--	Scroll of Ice Carol II
--	Teaches the song Ice Carol II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(447);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(474);
end;
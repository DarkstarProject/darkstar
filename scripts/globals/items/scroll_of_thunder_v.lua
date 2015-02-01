-----------------------------------------
--	ID: 4776
--	Scroll of Thunder V
--	Teaches the black magic Thunder V
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(168);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(168);
end;
-----------------------------------------
--	ID: 4922
--	Scroll of Stonera
--	Teaches the black magic Stonera
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(834);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(834);
end;
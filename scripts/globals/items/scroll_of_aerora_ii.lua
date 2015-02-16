-----------------------------------------
--	ID: 4921
--	Scroll of Aerora II
--	Teaches the black magic Aerora II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(833);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(833);
end;
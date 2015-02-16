-----------------------------------------
--	ID: 4920
--	Scroll of Aerora
--	Teaches the black magic Aerora
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(832);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(832);
end;
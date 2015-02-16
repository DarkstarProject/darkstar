-----------------------------------------
--	ID: 4827
--	Scroll of Comet
--	Teaches the black magic Comet
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(219);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(219);
end;
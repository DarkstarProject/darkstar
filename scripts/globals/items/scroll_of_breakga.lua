-----------------------------------------
--	ID: 4889
--	Scroll of Breakga
--	Teaches the black magic Breakga
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(365);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(365);
end;
-----------------------------------------
--	ID: 4619
--	Scroll of Curaga V
--	Teaches the white magic Curaga V
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(11);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(11);
end;
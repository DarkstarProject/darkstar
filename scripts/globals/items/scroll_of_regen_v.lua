-----------------------------------------
--	ID: 5086
--	Scroll of Regen V
--	Teaches the white magic Regen IV
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(504);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(504);
end;
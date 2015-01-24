-----------------------------------------
--	ID: 5058
--	Scroll of Lightning Carol II
--	Teaches the song Lightning Carol II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(450);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(450);
end;
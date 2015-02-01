-----------------------------------------
--	ID: 4891
--	Scroll of Blizzaja
--	Teaches the black magic Blizzaja
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(497);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(497);
end;
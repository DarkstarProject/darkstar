-----------------------------------------
--	ID: 4919
--	Scroll of Blizzara II
--	Teaches the black magic Blizzara II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(831);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(831);
end;
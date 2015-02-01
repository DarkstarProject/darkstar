-----------------------------------------
--	ID: 5101
--	Scroll of Arise
--	Teaches the white magic Arise
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(494);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(494);
end;
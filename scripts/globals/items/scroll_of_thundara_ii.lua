-----------------------------------------
--	ID: 4925
--	Scroll of Thundara II
--	Teaches the black magic Thundara II
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(837);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(837);
end;
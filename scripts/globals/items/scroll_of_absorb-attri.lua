-----------------------------------------
--	ID: 4887
--	Scroll of Absorb-Attri
--	Teaches the black magic Absorb-Attri
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(243);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(243);
end;
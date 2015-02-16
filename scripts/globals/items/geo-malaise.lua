-----------------------------------------
-- ID: 6123
-- Item: Geo-Malaise
-- Teaches the Geomancer Magic Geo-Malaise
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(820);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(820);
end;
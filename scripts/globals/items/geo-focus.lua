-----------------------------------------
-- ID: 6118
-- Item: Geo-Focus
-- Teaches the Geomancer Magic Geo-Focus
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(815);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(815);
end;
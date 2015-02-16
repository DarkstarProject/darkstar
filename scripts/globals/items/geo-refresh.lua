-----------------------------------------
-- ID: 6104
-- Item: Geo-Refresh
-- Teaches the Geomancer Magic Geo-Refresh
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(800);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(800);
end;
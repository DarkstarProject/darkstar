-----------------------------------------
-- ID: 6113
-- Item: Geo-Barrier
-- Teaches the Geomancer Magic Geo-Barrier
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(810);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(810);
end;
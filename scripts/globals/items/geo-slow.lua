-----------------------------------------
-- ID: 6128
-- Item: Geo-Slow
-- Teaches the Geomancer Magic Geo-Slow
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(825);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(825);
end;
-----------------------------------------
-- ID: 6108
-- Item: Geo-AGI
-- Teaches the Geomancer Magic Geo-AGI
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(805);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(805);
end;
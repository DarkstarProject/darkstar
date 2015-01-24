-----------------------------------------
-- ID: 6127
-- Item: Geo-Languor
-- Teaches the Geomancer Magic Geo-Languor
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(824);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(824);
end;
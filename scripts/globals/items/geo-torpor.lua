-----------------------------------------
-- ID: 6125
-- Item: Geo-Torpor
-- Teaches the Geomancer Magic Geo-Torpor
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(822);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(822);
end;
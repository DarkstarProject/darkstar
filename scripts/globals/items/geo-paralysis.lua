-----------------------------------------
-- ID: 6129
-- Item: Geo-Paralysis
-- Teaches the Geomancer Magic Geo-Paralysis
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(826);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(826);
end;
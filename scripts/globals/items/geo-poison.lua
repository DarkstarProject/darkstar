-----------------------------------------
-- ID: 6103
-- Item: Geo-Poison
-- Teaches the Geomancer Magic Geo-Poison
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(799);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(799);
end;
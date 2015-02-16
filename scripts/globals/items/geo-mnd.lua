-----------------------------------------
-- ID: 6110
-- Item: Geo-MND
-- Teaches the Geomancer Magic Geo-MND
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(807);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(807);
end;
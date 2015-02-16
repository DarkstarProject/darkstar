-----------------------------------------
-- ID: 6105
-- Item: Geo-STR
-- Teaches the Geomancer Magic Geo-STR
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(802);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(802);
end;
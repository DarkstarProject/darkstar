-----------------------------------------
-- ID: 6112
-- Item: Geo-Fury
-- Teaches the Geomancer Magic Geo-Fury
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(809);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(809);
end;
-----------------------------------------
-- ID: 6109
-- Item: Geo-INT
-- Teaches the Geomancer Magic Geo-INT
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(806);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(806);
end;
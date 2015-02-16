-----------------------------------------
-- ID: 6111
-- Item: Geo-CHR
-- Teaches the Geomancer Magic Geo-CHR
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(808);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(808);
end;
-----------------------------------------
-- ID: 6122
-- Item: Geo-Fade
-- Teaches the Geomancer Magic Geo-Fade
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(819);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(819);
end;
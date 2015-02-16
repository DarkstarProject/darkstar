-----------------------------------------
-- ID: 6126
-- Item: Geo-Vex
-- Teaches the Geomancer Magic Geo-Vex
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(823);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(823);
end;
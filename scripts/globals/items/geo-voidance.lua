-----------------------------------------
-- ID: 6117
-- Item: Geo-Voidance
-- Teaches the Geomancer Magic Geo-Voidance
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(814);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(814);
end;
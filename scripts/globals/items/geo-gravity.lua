-----------------------------------------
-- ID: 6130
-- Item: Geo-Gravity
-- Teaches the Geomancer Magic Geo-Gravity
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(827);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(827);
end;
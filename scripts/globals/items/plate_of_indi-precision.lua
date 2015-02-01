-----------------------------------------
-- ID: 6087
-- Item: Plate of Indi-Precision
-- Teaches the Geomancer Magic Indi-Precision
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(783);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(783);
end;
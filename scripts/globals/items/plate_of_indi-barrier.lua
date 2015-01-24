-----------------------------------------
-- ID: 6084
-- Item: Plate of Indi-Barrier
-- Teaches the Geomancer Magic Indi-Barrier
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(780);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(780);
end;
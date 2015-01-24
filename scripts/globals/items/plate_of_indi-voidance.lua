-----------------------------------------
-- ID: 6088
-- Item: Plate of Indi-Voidance
-- Teaches the Geomancer Magic Indi-Voidance
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(784);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(784);
end;
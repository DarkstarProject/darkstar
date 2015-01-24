-----------------------------------------
-- ID: 6074
-- Item: Plate of Indi-Poison
-- Teaches the Geomancer Magic Indi-Poison
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(769);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(769);
end;
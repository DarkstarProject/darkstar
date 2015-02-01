-----------------------------------------
-- ID: 6085
-- Item: Plate of Indi-Acumen
-- Teaches the Geomancer Magic Indi-Acumen
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(781);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(781);
end;
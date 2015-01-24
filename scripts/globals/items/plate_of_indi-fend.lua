-----------------------------------------
-- ID: 6086
-- Item: Plate of Indi-Fend
-- Teaches the Geomancer Magic Indi-Fend
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(782);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(782);
end;
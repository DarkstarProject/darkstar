-----------------------------------------
-- ID: 6089
-- Item: Plate of Indi-Focus
-- Teaches the Geomancer Magic Indi-Focus
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(785);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(785);
end;
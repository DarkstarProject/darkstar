-----------------------------------------
-- ID: 6076
-- Item: Plate of Indi-STR
-- Teaches the Geomancer Magic Indi-STR
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(772);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(772);
end;
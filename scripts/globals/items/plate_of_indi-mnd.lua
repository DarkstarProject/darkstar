-----------------------------------------
-- ID: 6081
-- Item: Plate of Indi-MND
-- Teaches the Geomancer Magic Indi-MND
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(777);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(777);
end;
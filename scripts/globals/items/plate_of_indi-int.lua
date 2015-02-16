-----------------------------------------
-- ID: 6080
-- Item: Plate of Indi-INT
-- Teaches the Geomancer Magic Indi-INT
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(776);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(776);
end;
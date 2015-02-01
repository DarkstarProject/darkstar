-----------------------------------------
-- ID: 6083
-- Item: Plate of Indi-Fury
-- Teaches the Geomancer Magic Indi-Fury
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(779);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(779);
end;
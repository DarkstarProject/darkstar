-----------------------------------------
-- ID: 6097
-- Item: Plate of Indi-Vex
-- Teaches the Geomancer Magic Indi-Vex
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(793);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(793);
end;
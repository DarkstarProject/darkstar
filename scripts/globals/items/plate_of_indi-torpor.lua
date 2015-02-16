-----------------------------------------
-- ID: 6096
-- Item: Plate of Indi-Torpor
-- Teaches the Geomancer Magic Indi-Torpor
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(792);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(792);
end;
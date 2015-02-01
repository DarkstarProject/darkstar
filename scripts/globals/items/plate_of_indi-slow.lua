-----------------------------------------
-- ID: 6099
-- Item: Plate of Indi-Slow
-- Teaches the Geomancer Magic Indi-Slow
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(795);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(795);
end;
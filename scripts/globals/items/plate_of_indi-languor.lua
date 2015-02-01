-----------------------------------------
-- ID: 6098
-- Item: Plate of Indi-Languor
-- Teaches the Geomancer Magic Indi-Languor
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(794);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(794);
end;
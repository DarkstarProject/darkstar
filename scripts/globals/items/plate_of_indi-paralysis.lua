-----------------------------------------
-- ID: 6100
-- Item: Plate of Indi-Paralysis
-- Teaches the Geomancer Magic Indi-Paralysis
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(796);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(796);
end;
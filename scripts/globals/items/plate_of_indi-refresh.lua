-----------------------------------------
-- ID: 6075
-- Item: Plate of Indi-Refresh
-- Teaches the Geomancer Magic Indi-Refresh
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(770);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(770);
end;
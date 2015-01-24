-----------------------------------------
-- ID: 6101
-- Item: Plate of Indi-Gravity
-- Teaches the Geomancer Magic Indi-Gravity
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(797);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(797);
end;
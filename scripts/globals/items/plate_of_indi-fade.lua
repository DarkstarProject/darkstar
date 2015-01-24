-----------------------------------------
-- ID: 6093
-- Item: Plate of Indi-Fade
-- Teaches the Geomancer Magic Indi-Fade
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(789);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(789);
end;
-----------------------------------------
-- ID: 6079
-- Item: Plate of Indi-AGI
-- Teaches the Geomancer Magic Indi-AGI
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(775);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(775);
end;
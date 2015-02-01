-----------------------------------------
-- ID: 6090
-- Item: Plate of Indi-Attunement
-- Teaches the Geomancer Magic Indi-Attunement
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(786);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(786);
end;
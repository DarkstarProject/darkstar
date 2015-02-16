-----------------------------------------
-- ID: 6073
-- Item: Plate of Indi-Regen
-- Teaches the Geomancer Magic Indi-Regen
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(768);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(768);
end;
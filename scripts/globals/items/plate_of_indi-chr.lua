-----------------------------------------
-- ID: 6082
-- Item: Plate of Indi-CHR
-- Teaches the Geomancer Magic Indi-CHR
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(778);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(778);
end;
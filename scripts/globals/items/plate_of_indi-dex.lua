-----------------------------------------
-- ID: 6077
-- Item: Plate of Indi-DEX
-- Teaches the Geomancer Magic Indi-DEX
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(773);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(773);
end;
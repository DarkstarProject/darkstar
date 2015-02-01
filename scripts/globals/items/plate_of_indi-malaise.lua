-----------------------------------------
-- ID: 6094
-- Item: Plate of Indi-Malaise
-- Teaches the Geomancer Magic Indi-Malaise
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(790);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(790);
end;
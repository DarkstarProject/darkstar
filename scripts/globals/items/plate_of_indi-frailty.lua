-----------------------------------------
-- ID: 6092
-- Item: Plate of Indi-Frailty
-- Teaches the Geomancer Magic Indi-Frailty
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(788);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(788);
end;
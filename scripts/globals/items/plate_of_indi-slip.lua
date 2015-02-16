-----------------------------------------
-- ID: 6095
-- Item: Plate of Indi-Slip
-- Teaches the Geomancer Magic Indi-Slip
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(791);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(791);
end;
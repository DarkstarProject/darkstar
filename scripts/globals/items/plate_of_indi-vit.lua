-----------------------------------------
-- ID: 6078
-- Item: Plate of Indi-VIT
-- Teaches the Geomancer Magic Indi-VIT
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(774);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(774);
end;
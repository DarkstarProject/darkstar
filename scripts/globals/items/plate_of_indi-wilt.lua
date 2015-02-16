-----------------------------------------
-- ID: 6091
-- Item: Plate of Indi-Wilt
-- Teaches the Geomancer Magic Indi-Wilt
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(787);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(787);
end;
-----------------------------------------
-- ID: 6121
-- Item: Geo-Frailty
-- Teaches the Geomancer Magic Geo-Frailty
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(818);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(818);
end;
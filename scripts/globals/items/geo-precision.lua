-----------------------------------------
-- ID: 6116
-- Item: Geo-Precision
-- Teaches the Geomancer Magic Geo-Precision
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(813);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(813);
end;
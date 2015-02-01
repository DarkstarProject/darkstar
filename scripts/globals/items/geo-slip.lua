-----------------------------------------
-- ID: 6124
-- Item: Geo-Slip
-- Teaches the Geomancer Magic Geo-Slip
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(821);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(821);
end;
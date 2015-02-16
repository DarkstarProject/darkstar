-----------------------------------------
-- ID: 6114
-- Item: Geo-Acumen
-- Teaches the Geomancer Magic Geo-Acumen
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(811);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(811);
end;
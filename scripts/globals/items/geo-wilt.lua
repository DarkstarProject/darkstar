-----------------------------------------
-- ID: 6120
-- Item: Geo-Wilt
-- Teaches the Geomancer Magic Geo-Wilt
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(817);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(817);
end;
-----------------------------------------
-- ID: 6107
-- Item: Geo-VIT
-- Teaches the Geomancer Magic Geo-VIT
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(804);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(804);
end;
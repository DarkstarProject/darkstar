-----------------------------------------
-- ID: 6115
-- Item: Geo-Fend
-- Teaches the Geomancer Magic Geo-Fend
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(812);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(812);
end;
-----------------------------------------
-- ID: 6102
-- Item: Geo-Regen
-- Teaches the Geomancer Magic Geo-Regen
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(798);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(798);
end;
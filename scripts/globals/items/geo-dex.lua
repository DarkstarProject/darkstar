-----------------------------------------
-- ID: 6106
-- Item: Geo-DEX
-- Teaches the Geomancer Magic Geo-DEX
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(803);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(803);
end;
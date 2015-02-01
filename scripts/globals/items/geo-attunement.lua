-----------------------------------------
-- ID: 6119
-- Item: Geo-Attunement
-- Teaches the Geomancer Magic Geo-Atunement
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(816);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(816);
end;
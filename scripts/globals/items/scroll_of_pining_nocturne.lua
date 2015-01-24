-----------------------------------------
--	ID: 5080
--	Scroll of Pining Nocturne
--	Teaches the song Pining Nocturne
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(472);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(472);
end;
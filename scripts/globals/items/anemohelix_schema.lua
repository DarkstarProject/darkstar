-----------------------------------------
--	ID: 6046
--	Anemohelix Schema
--	Teaches the black magic Anemohelix
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(280);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(280);
end;
-----------------------------------------
--	ID: 4851
--	Scroll of Meteor
--	Teaches the black magic Meteor
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return target:canLearnSpell(218);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addSpell(218);
end;
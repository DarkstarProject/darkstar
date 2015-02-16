-----------------------------------------
--	ID: 15998
--	Kocco's Earring
--  This earring functions in the same way as the spell Reraise II.
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	return 0;
end;
-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	duration = 3600;
		target:delStatusEffect(EFFECT_RERAISE);
		target:addStatusEffect(EFFECT_RERAISE,2,0,duration);
end;

-----------------------------------------
--	ID: 13171
--	Reraise Gorget
--  This necklace functions in the same way as the spell Reraise II.
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
	duration = 2700;
		target:delStatusEffect(EFFECT_RERAISE);
		target:addStatusEffect(EFFECT_RERAISE,2,0,duration);
end;

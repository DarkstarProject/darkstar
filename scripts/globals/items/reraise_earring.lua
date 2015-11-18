-----------------------------------------
--	ID: 14790
--	Reraise Earring
--  This earring functions in the same way as the spell Reraise.
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
	local duration = 7200;
    target:messageBasic(266,0, EFFECT_RERAISE);
		target:delStatusEffect(EFFECT_RERAISE);
		target:addStatusEffect(EFFECT_RERAISE,1,0,duration);
end;

-----------------------------------------
--	ID: 4182
--  Scroll of Instant ReRaise
--  Brings you back from the dead~!
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
   target:delStatusEffect(EFFECT_RERAISE);
   target:addStatusEffect(EFFECT_RERAISE,1,0,1800); --reraise 1, 30min duratio
end;
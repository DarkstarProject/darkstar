-----------------------------------------
--	ID: 15320
--	Powder Boots
--  Enchantment: "Flee"
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
	target:addStatusEffect(EFFECT_FLEE,100,0,30);
end;

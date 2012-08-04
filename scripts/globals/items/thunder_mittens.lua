-----------------------------------------
--	ID: 14987
--	Thunder Mittens
--  Enchantment: "Enthunder"
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
	effect = EFFECT_ENTHUNDER;
	doEnspell(target,target,nil,effect);
end;

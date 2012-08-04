-----------------------------------------
--	ID: 14992
--	Water Mitts
--  Enchantment: "Enwater"
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
	effect = EFFECT_ENWATER;
	doEnspell(target,target,nil,effect);
end;

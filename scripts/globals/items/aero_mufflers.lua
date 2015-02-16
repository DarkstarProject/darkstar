-----------------------------------------
-- ID: 14989
-- Item: Aero Mufflers
-- Enchantment: "Enaero"
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
	local effect = EFFECT_ENAERO;
	doEnspell(target,target,nil,effect);
end;

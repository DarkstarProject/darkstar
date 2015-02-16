-----------------------------------------
-- ID: 17706
-- Item: Vulcan Blade
-- Enchantment: "Enfire"
-- Charges: 30 Reuse: 300 Secs
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
	effect = EFFECT_ENFIRE;
	doEnspell(target,target,nil,effect);
end;

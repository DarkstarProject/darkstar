-----------------------------------------
-- ID: 17705
-- Item: Vulcan Degen
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

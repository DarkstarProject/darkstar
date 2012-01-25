-----------------------------------------
--	ID: 18067
--	Equip: Keen Zaghnal
--  Enchantment: Accuracy +3
--	Enchantment will wear off if weapon is unequipped.
--  Effect lasts for 30 minutes
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	if (target:getEquipID(0) ~= 18067) then
		target:delStatusEffect(EFFECT_ACCURACY_BOOST,18067);
	end
	return 0;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addStatusEffect(EFFECT_ACCURACY_BOOST,3,0,1800,FLAG_DISPELABLE,18067);
end;
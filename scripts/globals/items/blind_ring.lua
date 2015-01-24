-----------------------------------------
--	ID: 15834
--	Item: Blind Ring
--	Enchantment: Blind
--	Durration: 1 Min
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

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
    if(target:addStatusEffect(EFFECT_BLINDNESS, 5, 0, 60)) then
        target:messageBasic(205);
    else
        target:messageBasic(423); -- no effect
    end
end;

-----------------------------------------
--	ID: 15326
--	Item: Gargoyle Boots
--	Enchantment: Wyvern Stoneskin
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
    local pet = target:getPet();
    if(pet:addStatusEffect(EFFECT_STONESKIN, 200, 0, 60)) then
        target:messageBasic(205);
    else
        target:messageBasic(423); -- no effect
    end
end;

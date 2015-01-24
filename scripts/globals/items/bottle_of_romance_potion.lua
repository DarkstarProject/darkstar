-----------------------------------------
-- ID: 5321
-- Item: Bottle of Romance Potion
-- Item Effect: Restores 20% HP to all
-- party members
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
	local result = 0;
	local mHP = target:getMaxHP();
	local cHP = target:getHP();

	if (mHP == cHP) then
		result = 56; -- Does not let player use item if their HP is full
	end

	return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	local amount = (target:getMaxHP()/100) * 20 * ITEM_POWER;
	target:addHP((target:getMaxHP() / 100) * 20 * ITEM_POWER);
	target:messageBasic(24,amount);
end;
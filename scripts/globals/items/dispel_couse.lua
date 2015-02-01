-----------------------------------------
--	ID: 18095
--	Item: Dispel Couse
--	Enchantment: Sames as Dispel
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	local dispel = target:dispelStatusEffect();
	if(dispel == EFFECT_NONE) then
		skill:setMsg(MSG_NO_EFFECT);
	else
		skill:setMsg(MSG_DISPEL);
	end
end;
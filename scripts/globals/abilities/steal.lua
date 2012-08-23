-----------------------------------
-- Ability: Steal
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbility(player, target, ability)
	local ItemId = target:getStealItem();
	print(ItemId);
end;
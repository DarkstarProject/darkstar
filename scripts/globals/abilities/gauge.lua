-----------------------------------
-- Ability: Gauge
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onAbilityCheck(player,target,ability)
	if (player:getPet() ~= nil ) then
		return MSGBASIC_ALREADY_HAS_A_PET,0;
	else
		return 0,0;
	end
end;

function onUseAbility(player, target, ability)
	-- Nothing, all is handled in the core.
	return 0,0;
end;

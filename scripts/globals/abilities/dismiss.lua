-----------------------------------
-- Ability: Release
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onAbilityCheck(player,target,ability)
	return 0,0;
end;

function onUseAbility(player, target, ability)
	-- Reset the Call Wyvern Ability.
	pet = player:getPet();
	if pet:getHP() >= pet:getMaxHP()
	then
		player:resetRecast(RECAST_ABILITY, 163); -- call_wyvern
	end;
	target:despawnPet();
end;

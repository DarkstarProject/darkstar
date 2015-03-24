-----------------------------------
-- Ability: Stealth Shot
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
	local power = 10 + player:getMerit(MERIT_STEALTH_SHOT);

	player:addStatusEffect(EFFECT_STEALTH_SHOT, -power, 0, 60);
end;

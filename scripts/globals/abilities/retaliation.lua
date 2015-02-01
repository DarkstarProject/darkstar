-----------------------------------
-- Ability: Retaliation
-- Allows you to counterattack but
-- reduces movement speed.
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	return 0,0;
end;

function OnUseAbility(player, target, ability)
	local power = math.random(40,50);
	player:delStatusEffect(EFFECT_RETALIATION);
	player:addStatusEffect(EFFECT_RETALIATION,power,0,180);
end;
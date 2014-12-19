-----------------------------------
-- Ability: Double Up
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onAbilityCheck(player,target,ability)
	if (not player:hasStatusEffect(EFFECT_DOUBLE_UP_CHANCE)) then
		return MSGBASIC_NO_ELIGIBLE_ROLL,0;
	else
		return 0,0;
	end
end;

function onUseAbility(player, target, ability)
end;

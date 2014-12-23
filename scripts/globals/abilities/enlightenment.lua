-----------------------------------
-- Ability: Enlightenment
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onAbilityCheck(player,target,ability)
	if player:hasStatusEffect(EFFECT_ENLIGHTENMENT) then
		return MSGBASIC_EFFECT_ALREADY_ACTIVE, 0;
	end
	return 0,0;
end;

function onUseAbility(player, target, ability)
	local merit = (player:getMerit(MERIT_ENLIGHTENMENT) - 5);
	player:addStatusEffect(EFFECT_ENLIGHTENMENT,merit,0,60);
    return EFFECT_ENLIGHTENMENT;
end;
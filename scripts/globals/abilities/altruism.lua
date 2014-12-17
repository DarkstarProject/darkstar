-----------------------------------
-- Ability: Altruism
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onAbilityCheck(player,target,ability)
	if player:hasStatusEffect(EFFECT_ALTRUISM) then
		return MSGBASIC_EFFECT_ALREADY_ACTIVE, 0;
	end
	return 0,0;
end;

function onUseAbility(player, target, ability)
	player:addStatusEffect(EFFECT_ALTRUISM,player:getMerit(MERIT_ALTRUISM),0,60);

    return EFFECT_ALTRUISM;
end;
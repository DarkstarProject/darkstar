-----------------------------------
-- Ability: Snake Eye
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
	player:addStatusEffect(EFFECT_SNAKE_EYE,(player:getMerit(MERIT_SNAKE_EYE) - 5),0,60);

    return EFFECT_SNAKE_EYE;
end;
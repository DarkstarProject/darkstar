-----------------------------------
-- Ability: Berserk
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");




function onAbilityCheck(player,target,ability)
	return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player, target, ability)
	player:addStatusEffect(EFFECT_DIABOLIC_EYE,player:getMerit(MERIT_DIABOLIC_EYE),0,180);
end;
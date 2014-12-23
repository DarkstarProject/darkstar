-----------------------------------
-- Ability: Last Resort
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
	player:addStatusEffect(EFFECT_LAST_RESORT,player:getMerit(MERIT_DESPERATE_BLOWS),0,180);
end;
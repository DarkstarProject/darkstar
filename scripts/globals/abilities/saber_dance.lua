-----------------------------------
-- Ability: Saber Dance
-----------------------------------

require("scripts/globals/status");


-----------------------------------
-- onUseAbility
-----------------------------------

function onAbilityCheck(player,target,ability)
	return 0,0;
end;

function onUseAbility(player, target, ability)
	player:addStatusEffect(EFFECT_SABER_DANCE,50,3,300);
end;
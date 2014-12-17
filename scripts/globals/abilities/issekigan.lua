-----------------------------------
-- Ability: Issekigan
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onAbilityCheck(player,target,ability)
	return 0,0;
end;

function onUseAbility(player, target, ability)
	target:addStatusEffect(EFFECT_ISSEKIGAN,25,0,60);
end;

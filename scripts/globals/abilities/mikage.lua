-----------------------------------
-- Ability: Mikage
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onAbilityCheck(player,target,ability)
	return 0,0;
end;

function onUseAbility(player, target, ability)
	target:addStatusEffect(EFFECT_MIKAGE,0,0,45);
end;

-----------------------------------
-- Ability: Efflux
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function onAbilityCheck(player,target,ability)
	return 0,0;
end;

function OnUseAbility(player, target, ability)
	target:delStatusEffect(EFFECT_EFFLUX);
	target:addStatusEffect(EFFECT_EFFLUX,1,0,60);
end;

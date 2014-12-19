-----------------------------------
-- Ability: Sekkanoki
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
	target:delStatusEffect(EFFECT_SEKKANOKI);
	target:addStatusEffect(EFFECT_SEKKANOKI,1,0,60);
end;

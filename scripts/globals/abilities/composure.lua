-----------------------------------
-- Ability: Composure
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
	player:delStatusEffect(EFFECT_COMPOSURE);
	player:addStatusEffect(EFFECT_COMPOSURE,1,0,7200);
end;

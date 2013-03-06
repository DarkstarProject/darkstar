-----------------------------------
-- Ability: Composure
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
	player:delStatusEffect(EFFECT_COMPOSURE);
	player:addStatusEffect(EFFECT_COMPOSURE,1,0,7200);
end;

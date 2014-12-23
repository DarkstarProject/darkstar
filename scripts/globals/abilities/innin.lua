-----------------------------------
-- Ability: Innin
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
	target:delStatusEffect(EFFECT_INNIN);
	target:delStatusEffect(EFFECT_YONIN);
	target:addStatusEffect(EFFECT_INNIN,30,10,300);
end;

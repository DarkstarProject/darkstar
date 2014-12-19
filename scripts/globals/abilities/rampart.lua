-----------------------------------
-- Ability: Rampart
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
	target:addStatusEffect(EFFECT_MAGIC_SHIELD,1,0,30);
end;

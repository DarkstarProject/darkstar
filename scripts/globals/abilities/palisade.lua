-----------------------------------
-- Ability: Palisade
-- Increases chances of blocking
-- with shield, eliminates enmity
-- loss.
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
	player:addStatusEffect(EFFECT_PALISADE,1,0,60);
end;

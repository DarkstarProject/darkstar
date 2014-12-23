-----------------------------------
-- Ability: Accession
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
	player:addStatusEffect(EFFECT_ASTRAL_FLOW,1,0,180);

    return EFFECT_ASTRAL_FLOW;
end;
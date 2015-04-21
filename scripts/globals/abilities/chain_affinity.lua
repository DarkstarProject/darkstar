-----------------------------------
-- Ability: Chain Affinity
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
    player:addStatusEffect(EFFECT_CHAIN_AFFINITY,1,0,30);

    return EFFECT_CHAIN_AFFINITY;
end;
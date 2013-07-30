-----------------------------------
-- Ability: Chain Affinity
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
	player:addStatusEffect(EFFECT_BURST_AFFINITY,1,0,30);

    return EFFECT_BURST_AFFINITY;
end;
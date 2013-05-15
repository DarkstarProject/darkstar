-----------------------------------
-- Ability: Accession
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	if player:hasStatusEffect(EFFECT_MANIFESTATION) then
		return MSGBASIC_EFFECT_ALREADY_ACTIVE, 0;
	end
	return 0,0;
end;

function OnUseAbility(player, target, ability)
	player:addStatusEffect(EFFECT_MANIFESTATION,1,0,60);

    return EFFECT_MANIFESTATION;
end;
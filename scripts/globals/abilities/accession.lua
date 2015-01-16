-----------------------------------
-- Ability: Accession
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onAbilityCheck(player,target,ability)
	if player:hasStatusEffect(EFFECT_ACCESSION) then
		return MSGBASIC_EFFECT_ALREADY_ACTIVE, 0;
	end
	return 0,0;
end;

function onUseAbility(player, target, ability)
	player:addStatusEffect(EFFECT_ACCESSION,1,0,60);

    return EFFECT_ACCESSION;
end;
-----------------------------------
-- Ability: Dark Arts
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
	player:delStatusEffect(EFFECT_LIGHT_ARTS);
	player:delStatusEffect(EFFECT_ADDENDUM_WHITE);
	player:delStatusEffect(EFFECT_PENURY);
	player:delStatusEffect(EFFECT_CELERITY);
	player:delStatusEffect(EFFECT_ACCESSION);
	player:delStatusEffect(EFFECT_RAPTURE);
	player:delStatusEffect(EFFECT_ALTRUISM);
	player:delStatusEffect(EFFECT_TRANQUILITY);
	player:delStatusEffect(EFFECT_PERPETUANCE);
	player:addStatusEffect(EFFECT_DARK_ARTS,1,0,7200);

    return EFFECT_DARK_ARTS;
end;
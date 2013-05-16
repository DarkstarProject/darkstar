-----------------------------------
-- Ability: Dark Arts
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	if player:hasStatusEffect(EFFECT_DARK_ARTS) or player:hasStatusEffect(EFFECT_ADDENDUM_BLACK) then
		return MSGBASIC_EFFECT_ALREADY_ACTIVE, 0;
	end
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
	
	local helixbonus = 0;
	if (player:getMainJob() == JOB_SCH and player:getMainLvl() >= 20) then
		helixbonus = math.floor(player:getMainLvl() / 5) - 3;
	end
	
	player:addStatusEffect(EFFECT_DARK_ARTS,1,0,7200,helixbonus);

    return EFFECT_DARK_ARTS;
end;
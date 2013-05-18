-----------------------------------
-- Ability: Addendum: White
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	if player:hasStatusEffect(EFFECT_ADDENDUM_WHITE) then
		return MSGBASIC_EFFECT_ALREADY_ACTIVE, 0;
	end
	return 0,0;
end;

function OnUseAbility(player, target, ability)
	player:delStatusEffectSilent(EFFECT_DARK_ARTS);
	player:delStatusEffectSilent(EFFECT_ADDENDUM_BLACK);
	player:delStatusEffectSilent(EFFECT_LIGHT_ARTS);
	
	local skillbonus = player:getMod(MOD_LIGHT_ARTS_SKILL);
	local effectbonus = player:getMod(MOD_LIGHT_ARTS_EFFECT);
	local regenbonus = 0;
	if (player:getMainJob() == JOB_SCH and player:getMainLvl() >= 20) then
		regenbonus = 3 * math.floor((player:getMainLvl() - 10) / 10);
	end
	
	player:addStatusEffectEx(EFFECT_ADDENDUM_WHITE,EFFECT_ADDENDUM_WHITE,effectbonus,0,7200,0,regenbonus,true);

    return EFFECT_ADDENDUM_WHITE;
end;
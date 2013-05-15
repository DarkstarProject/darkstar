-----------------------------------
-- Ability: Addendum: Black
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	if player:hasStatusEffect(EFFECT_ADDENDUM_BLACK) then
		return MSGBASIC_EFFECT_ALREADY_ACTIVE, 0;
	end
	return 0,0;
end;

function OnUseAbility(player, target, ability)
	player:delStatusEffectSilent(EFFECT_DARK_ARTS);
	
	local skillbonus = player:getMod(MOD_DARK_ARTS_SKILL);
	local effectbonus = player:getMod(MOD_DARK_ARTS_EFFECT);
	
	player:addStatusEffectEx(EFFECT_ADDENDUM_BLACK,EFFECT_ADDENDUM_BLACK,effectbonus,0,7200,0,true);

    return EFFECT_LIGHT_ARTS;
end;
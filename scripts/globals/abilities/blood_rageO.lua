-----------------------------------
-- Ability: Blood Rage
-- Enhances Crit Hit Rate fo party
-- members within the AoE.
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

	local duration = 30;
	duration = duration + player:getMod(MOD_BLOOD_RAGE);
	
	if(player:hasStatusEffect(EFFECT_WARCRY) == true) then
		player:delStatusEffect(EFFECT_WARCRY);
	end
	player:addStatusEffect(EFFECT_BLOOD_RAGE,20,0,duration);
end;
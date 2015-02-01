-----------------------------------
-- Ability: Sacrosanctity
-- Enhances magic defense for party
-- members within area of effect. 
-- Reduces magic damage by 75%
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
	player:addStatusEffect(EFFECT_SACROSANCTITY,1,0,60);
end;
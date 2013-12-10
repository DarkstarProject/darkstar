-----------------------------------
-- Ability: Double Shot
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

	local chance = 40;
	
	player:addStatusEffect(EFFECT_DOUBLE_SHOT,chance,0,90);
end;

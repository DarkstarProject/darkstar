-----------------------------------
-- Ability: Double Up
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	if (not player:hasStatusEffect(EFFECT_DOUBLE_UP_CHANCE)) then
		return MSGBASIC_NO_ELIGIBLE_ROLL,0;
	else
		return 0,0;
	end
end;

function OnUseAbility(player, target, ability)
end;

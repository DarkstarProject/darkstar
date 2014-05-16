-----------------------------------
-- Ability: Issekigan
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	return 0,0;
end;

function OnUseAbility(player, target, ability)
	target:addStatusEffect(EFFECT_ISSEKIGAN,25,0,60);
end;

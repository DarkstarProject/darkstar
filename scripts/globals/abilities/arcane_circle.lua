-----------------------------------
-- Ability: Arcane Circle
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	return 0,0;
end;

function OnUseAbility(player, target, ability)
	target:addStatusEffect(EFFECT_ARCANE_CIRCLE,8,0,180);
end;

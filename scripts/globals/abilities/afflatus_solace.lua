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
	target:delStatusEffect(EFFECT_AFFLATUS_SOLACE);
	target:delStatusEffect(EFFECT_AFFLATUS_MISERY);
	target:addStatusEffect(EFFECT_AFFLATUS_SOLACE,8,0,7200);
end;

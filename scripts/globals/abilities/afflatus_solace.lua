-----------------------------------
-- Ability: Arcane Circle
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbility(player, target, ability)
	target:delStatusEffect(EFFECT_AFFLATUS_SOLACE);
	target:delStatusEffect(EFFECT_AFFLATUS_MISERY);
	target:addStatusEffect(EFFECT_AFFLATUS_SOLACE,8,0,7200);
end;

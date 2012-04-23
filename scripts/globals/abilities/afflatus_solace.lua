-----------------------------------
-- Ability: Arcane Circle
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbility(player, target, ability)
	target:addStatusEffect(EFFECT_AFFLATUS_SOLACE,8,0,180);
	--target:updateEnmity(target,1,80);
end;

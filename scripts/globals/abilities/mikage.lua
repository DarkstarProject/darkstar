-----------------------------------
-- Ability: Mikage
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	return 0,0;
end;

function OnUseAbility(player, target, ability)
	target:addStatusEffect(EFFECT_MIKAGE,0,0,45);
end;

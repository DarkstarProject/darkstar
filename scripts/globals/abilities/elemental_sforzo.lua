-----------------------------------
-- Ability: Elemental Sforzo
-- Grants immunity to all magic
-- attacks.
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	return 0,0;
end;

function OnUseAbility(player, target, ability)
	target:addStatusEffect(EFFECT_ELEMENTAL_SFORZO,1,0,30);
end;
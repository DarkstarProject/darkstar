-----------------------------------
-- Ability: Seigan
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	if (not target:isWeaponTwoHanded()) then
		return MSGBASIC_NEEDS_2H_WEAPON,0;
	else
		return 0,0;
	end
end;

function OnUseAbility(player, target, ability)
	if(target:isWeaponTwoHanded()) then
		target:delStatusEffect(EFFECT_HASSO);
		target:delStatusEffect(EFFECT_SEIGAN);
		target:addStatusEffect(EFFECT_SEIGAN,0,0,300);
	end
end;

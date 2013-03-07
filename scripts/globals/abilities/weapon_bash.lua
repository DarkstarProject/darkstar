-----------------------------------
-- Ability: Weapon Bash
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	if (not player:isWeaponTwoHanded()) then
		return MSGBASIC_NEEDS_2H_WEAPON,0;
	else
		return 0,0;
	end
end;

function OnUseAbility(player, target, ability)

end;

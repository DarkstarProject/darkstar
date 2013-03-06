-----------------------------------
-- Ability: Blood Weapon
-----------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	return 0,0;
end;

function OnUseAbility(player, target, ability)
	effect = EFFECT_BLOOD_WEAPON;
	doEnspell(player,target,nil,effect);
end;
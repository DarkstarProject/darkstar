-----------------------------------
-- Ability: Blood Weapon
-----------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onUseAbility
-----------------------------------

function onAbilityCheck(player,target,ability)
	return 0,0;
end;

function onUseAbility(player, target, ability)
	local effect = EFFECT_BLOOD_WEAPON;
	doEnspell(player,target,nil,effect);
end;
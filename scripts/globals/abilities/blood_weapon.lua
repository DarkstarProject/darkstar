-----------------------------------
-- Ability: Blood Weapon
-----------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbility(player, target, ability)
	effect = EFFECT_BLOOD_WEAPON;
	doEnspell(player,target,nil,effect);
end;
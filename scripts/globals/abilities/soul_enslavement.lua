-----------------------------------
-- Ability: Soul Enslavement
-- Causes all attacks to drain
-- enemy's TP.
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
	local effect = EFFECT_SOUL_ENSLAVEMENT;
	doEnspell(player,target,nil,effect);
end;
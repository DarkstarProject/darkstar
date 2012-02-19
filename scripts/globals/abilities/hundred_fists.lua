-----------------------------------
-- Ability:	Hundred Fists
-----------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbility(player, target, ability)
	player:addStatusEffect(EFFECT_HUNDRED_FISTS,1,0,45);
end;
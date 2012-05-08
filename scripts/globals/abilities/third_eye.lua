-----------------------------------
-- Ability: Third Eye
-----------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbility(player, target, ability)
	player:addStatusEffect(EFFECT_THIRD_EYE,1,0,30);
end;
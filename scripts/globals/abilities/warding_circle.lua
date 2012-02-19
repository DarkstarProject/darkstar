-----------------------------------
-- Ability: Warding Circle
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbility(player, target, ability)
	target:addStatusEffect(EFFECT_WARDING_CIRCLE,1,0,60);
end;

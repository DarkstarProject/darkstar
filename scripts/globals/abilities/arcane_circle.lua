-----------------------------------
--	     ARCANE CIRCLE		 --
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
function OnUseAbility(player, target, ability)
	target:addStatusEffect(EFFECT_ARCANE_CIRCLE,1,0,60);
end;

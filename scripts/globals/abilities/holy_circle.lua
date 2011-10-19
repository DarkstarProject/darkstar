-----------------------------------
--	     HOLY CIRCLE		 --
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
function OnUseAbility(player, target, ability)
	target:addStatusEffect(EFFECT_HOLY_CIRCLE,1,0,60);
end;

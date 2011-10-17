-----------------------------------
--	     WARCRY		 --
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
function OnUseAbility(player, target, ability)
	target:addStatusEffect(EFFECT_WARCRY,1,0,30);
end;

-----------------------------------
--	     RAMPART		 --
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
function OnUseAbility(player, target, ability)
	target:addStatusEffect(EFFECT_MAGIC_SHIELD,1,0,30);
end;

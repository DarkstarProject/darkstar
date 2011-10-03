-----------------------------------
--	Last Resort	 	 --
-----------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");
function OnUseAbility(player, target, ability)
	player:addStatusEffect(EFFECT_LAST_RESORT,1,0,180);
end;
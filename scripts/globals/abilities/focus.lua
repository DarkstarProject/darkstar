-----------------------------------
--	Focus			 	 		 
-----------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");
function OnUseAbility(player, target, ability)
	player:addStatusEffect(EFFECT_FOCUS,1,0,120);
end;
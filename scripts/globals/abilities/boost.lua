-----------------------------------
--	Boost		 	 --
-----------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");
function OnUseAbility(player, target, ability)
	player:addStatusEffect(EFFECT_BOOST,1,0,300);
end;
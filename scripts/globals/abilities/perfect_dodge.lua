-----------------------------------
--	Perfect Dodge	 	 --
-----------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");
function OnUseAbility(player, target, ability)
	player:addStatusEffect(EFFECT_PERFECT_DODGE,1,0,45);
end;
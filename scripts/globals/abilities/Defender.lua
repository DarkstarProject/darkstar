-----------------------------------
--	Perfect Dodge	 	 --
-----------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");
function OnUseAbility(player, target, ability)
	player:addStatusEffect(EFFECT_DEFENDER,1,0,180);
end;
-----------------------------------
--	AGGRESSOR		 --
-----------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");
function OnUseAbility(player, target, ability)
	player:addStatusEffect(EFFECT_AGGRESSOR,1,0,180);
end;
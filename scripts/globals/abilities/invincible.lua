-----------------------------------
-- 	Invincible		 --
-----------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");

function OnUseAbility(player, target, ability)
	player:addStatusEffect(EFFECT_INVINCIBLE,1,0,30);
end;
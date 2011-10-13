-----------------------------------
--	MEIKYO_SHISUI
-----------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");
function OnUseAbility(player, target, ability)
	player:addStatusEffect(EFFECT_MEIKYO_SHISUI,1,0,30);
	player:addTP(300);
end;
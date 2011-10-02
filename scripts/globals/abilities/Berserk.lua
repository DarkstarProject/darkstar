-----------------------------------
--	Mighty Strikes	 	 --
-----------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");
function OnUseAbility(player, target, ability)
	player:addStatusEffect(EFFECT_BERSERK,1,0,180);
end;
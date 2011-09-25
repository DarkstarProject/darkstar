-----------------------------------
--	Mighty Strikes	 	 --
-----------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");
function OnUseJobAbility(player, target, ability)
	player:addStatusEffect(EFFECT_MIGHTY_STRIKES,1,0,45);
end;
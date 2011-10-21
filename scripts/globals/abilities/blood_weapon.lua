-----------------------------------
--	BLOOD WEAPON
-----------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");
function OnUseAbility(player, target, ability)
	player:addStatusEffect(EFFECT_BLOOD_WEAPON,1,0,30);
end;
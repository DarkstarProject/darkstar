-----------------------------------
--		Divine Seal		 	 --
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
function OnUseAbility(player, target, ability)
	player:addStatusEffect(EFFECT_DIVINE_SEAL,1,0,60);
end;

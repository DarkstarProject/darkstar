-----------------------------------------
--	Ability: Manafont
--	Eliminates the cost of magic spells.
-----------------------------------------
-- Should make casting spells uninteruptable
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
function OnUseAbility(player, target, ability)
	player:addStatusEffect(EFFECT_MANAFONT,1,0,60);
end;
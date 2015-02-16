-----------------------------------
-- 	Soul Voice
-- 	Enhances the effect of songs.
--
--	Actually doubles the effect of songs.
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

function OnUseAbility(player, target, ability)
	target:addStatusEffect(EFFECT_SOUL_VOICE,1,0,180);
	target:updateEnmity(player,0,1);
end;

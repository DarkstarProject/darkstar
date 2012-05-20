-----------------------------------
-- Ability: Sekkanoki
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbility(player, target, ability)
	target:delStatusEffect(EFFECT_SEKKANOKI);
	target:addStatusEffect(EFFECT_SEKKANOKI,1,0,60);
end;

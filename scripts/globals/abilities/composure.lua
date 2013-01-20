-----------------------------------
-- Ability: Composure
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbility(player, target, ability)
	player:delStatusEffect(EFFECT_COMPOSURE);
	player:addStatusEffect(EFFECT_COMPOSURE,1,0,7200);
end;

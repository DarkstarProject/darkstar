-----------------------------------
-- Ability: Warcry
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbility(player, target, ability)
	target:addStatusEffect(EFFECT_WARCRY,1,0,30);
end;

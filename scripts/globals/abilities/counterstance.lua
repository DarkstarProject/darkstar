-----------------------------------
-- Ability: Counterstance
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbility(player, target, ability)
	target:delStatusEffect(EFFECT_COUNTERSTANCE); --if not found this will do nothing
	target:addStatusEffect(EFFECT_COUNTERSTANCE,1,0,300);
end;

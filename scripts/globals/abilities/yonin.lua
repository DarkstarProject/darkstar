-----------------------------------
-- Ability: Yonin
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbility(player, target, ability)
	target:delStatusEffect(EFFECT_INNIN);
	target:delStatusEffect(EFFECT_YONIN);
	target:addStatusEffect(EFFECT_YONIN,30,10,300);
end;

-----------------------------------
--       ARCANE CIRCLE           --
-----------------------------------

require("scripts/globals/status");

function OnUseAbility(player, target, ability)
	target:addStatusEffect(EFFECT_ARCANE_CIRCLE,8,0,180);
end;

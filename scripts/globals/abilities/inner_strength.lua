-----------------------------------
-- Ability: Inner Strength
-- Doubles your maximum HP and
-- increases your current HP by
-- the same amount. 
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	return 0,0;
end;

function OnUseAbility(player, target, ability)
	local mHP = target:getMaxHP();
	local duration = 30;

	player:addStatusEffect(EFFECT_INNER_STRENGTH,100,3,duration);
	target:restoreHP(mHP);

	return EFFECT_INNER_STRENGTH;

end;
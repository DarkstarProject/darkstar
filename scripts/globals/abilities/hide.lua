-----------------------------------
-- Ability: Hide
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

	local duration = math.random(30, 300);

	player:addStatusEffect(EFFECT_HIDE,1,0,(duration * SNEAK_INVIS_DURATION_MULTIPLIER));
end;

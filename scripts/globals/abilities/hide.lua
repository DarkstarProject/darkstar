-----------------------------------
-- Ability: Hide
-----------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbility(player, target, ability)

	local duration = math.random(30, 300);
	duration = math.random(30, 300);
	duration = math.random(30, 300);

	player:addStatusEffect(EFFECT_HIDE,1,0,(duration * SNEAK_INVIS_DURATION_MULTIPLIER));
end;

-----------------------------------
-- Ability: Fly High
-- Reduces the recast time of jumps
-- to 10 seconds. All jump recast
-- timers will be reset when the
-- ability is used.  
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
	player:resetRecast(RECAST_ABILITY,158);
	player:resetRecast(RECAST_ABILITY,159);
	player:resetRecast(RECAST_ABILITY,160);
	player:addStatusEffect(EFFECT_FLY_HIGH,1,0,30);
	return EFFECT_FLY_HIGH;
end;
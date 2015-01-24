-----------------------------------
-- Ability: Perfect Counter
-- Allows you to counter the next 
-- attack directed at you. Procs 
-- after counter.
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
	player:addStatusEffect(EFFECT_PERFECT_COUNTER,1,0,30);
end;
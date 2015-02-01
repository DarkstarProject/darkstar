-----------------------------------
-- Ability: Clarion Call
-- Increases the number of songs
-- that can affect party members
-- by one.  
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
	player:addStatusEffect(EFFECT_CLARION_CALL,1,0,180);
	return EFFECT_CLARION_CALL;
end;
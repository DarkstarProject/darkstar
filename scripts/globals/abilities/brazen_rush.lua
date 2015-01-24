-----------------------------------
-- Ability: Brazen Rush
-- Increases your chance to execute
-- a double attack to 100%. Effect
-- dissipates over time.
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	return 0,0;
end;

function OnUseAbility(player, target, ability)
	local duration = 30;
	player:addStatusEffect(EFFECT_BRAZEN_RUSH,1,3,duration);
	return EFFECT_BRAZEN_RUSH;
end;
-----------------------------------
-- Ability: Feint
-- Your next attack will greatly
-- reduce an enemy's evasion.
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	return 0,0;
end;

function OnUseAbility(player, target, ability)
	local duration = 60;
	player:addStatusEffect(EFFECT_FEINT,1,0,duration);
end;
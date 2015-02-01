-----------------------------------
-- Ability: Dragon Breaker
-- Lowers Acc Eva MAcc MEva and TP
-- Gain for Dragons.
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	if (target:getSystem() == 10) then
		return 0,0;
	else
		return MSGBASIC_UNABLE_TO_USE_JA2,0;
	end
end;

function OnUseAbility(player, target, ability)
	target:addStatusEffect(EFFECT_DRAGON_BREAKER,-10,0,180);
end;
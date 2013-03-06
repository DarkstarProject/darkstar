-----------------------------------
-- Ability: Benediction
-----------------------------------




-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	return 0,0;
end;

function OnUseAbility(player, target, ability)
	target:eraseStatusEffect(true);
	target:addHP(target:getMaxHP() * player:getMainLvl() / target:getMainLvl());
end;
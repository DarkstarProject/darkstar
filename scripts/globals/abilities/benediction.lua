-----------------------------------
-- Ability: Benediction
-----------------------------------




-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbility(player, target, ability)
	target:eraseStatusEffect(true);
	target:addHP(target:getMaxHP() * player:getMainLvl() / target:getMainLvl());
end;
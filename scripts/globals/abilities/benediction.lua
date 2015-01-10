-----------------------------------
-- Ability: Benediction
-----------------------------------




-----------------------------------
-- onUseAbility
-----------------------------------

function onAbilityCheck(player,target,ability)
	return 0,0;
end;

function onUseAbility(player, target, ability)
	target:eraseAllStatusEffect();

    local heal = (target:getMaxHP() * player:getMainLvl()) / target:getMainLvl();

    local maxHeal = target:getMaxHP() - target:getHP();

    if(heal > maxHeal) then
        heal = maxHeal;
    end

    player:updateEnmityFromCure(target,heal);
	target:addHP(heal);
	target:wakeUp();

    return heal;
end;
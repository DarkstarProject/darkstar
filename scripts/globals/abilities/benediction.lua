-----------------------------------
-- Ability: Benediction
-- Restores a large amount of HP and removes all status ailments for party members within area of effect.
-- Obtained: White Mage Level 1
-- Recast Time: 1:00:00
-- Duration: Instant
-----------------------------------

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    target:eraseAllStatusEffect();

    local heal = (target:getMaxHP() * player:getMainLvl()) / target:getMainLvl();

    local maxHeal = target:getMaxHP() - target:getHP();

    if (heal > maxHeal) then
        heal = maxHeal;
    end

    player:updateEnmityFromCure(target,heal);
    target:addHP(heal);
    target:wakeUp();

    return heal;
end;
-----------------------------------
-- Ability: Provoke
-- Goads an enemy into attacking you.
-- Obtained: Warrior Level 5
-- Recast Time: 0:30
-- Duration: 30 seconds
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0
end

function onUseAbility(user,target,ability)
    target:addEnmity(user, 1, 1800)
    --leave blank please! This file will be deleted when the core is updated. So Provoke shouldn't work till then?!
end
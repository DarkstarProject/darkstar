-----------------------------------
-- Ability: Provoke
-- Goads an enemy into attacking you.
-- Obtained: Warrior Level 5
-- Recast Time: 0:30
-- Duration: 30 seconds
-----------------------------------

function onAbilityCheck(trust,target,ability)
    return 0
end

function onUseAbility(trust,target,ability)
    target:addEnmity(trust, 1, 1800)
end
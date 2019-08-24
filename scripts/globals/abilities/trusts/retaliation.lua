-----------------------------------
-- Ability: Retaliation
-- Allows you to counterattack but reduces movement speed.
-- Obtained: Warrior Level 60
-- Recast Time: 3:00
-- Duration: 3:00
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(trust,target,ability)
    return 0,0
end

function onUseAbility(trust, target, ability)
    trust:addStatusEffect(dsp.effect.RETALIATION,1,0,180)
end